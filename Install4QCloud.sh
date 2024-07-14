#!/bin/bash  

db_user="root"
db_host=$(hostname -I | awk '{print $1}')
db_name="crossgate"

sudo chmod -R 777 gmsv/*
echo "请输入你要设置的数据库密码"
read db_password;
sudo rm -rf mysql.ini
echo "[client]">mysql.ini
echo "host="$db_host>>mysql.ini
echo "user="$db_user>>mysql.ini
echo "password="$db_password>>mysql.ini
echo "database=mysql">>mysql.ini
# 获取脚本的完整路径  
REAL_SCRIPT_PATH="$(readlink -f "$0")"  
# 提取脚本所在的目录  
SCRIPT_DIR="$(dirname "$REAL_SCRIPT_PATH")"  

# 检查docker命令是否存在，如果不存在则安装Docker 
if command -v docker > /dev/null; then
    echo "docker已安装"
else
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://mirrors.cloud.tencent.com/docker-ce/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://mirrors.cloud.tencent.com/docker-ce/linux/ubuntu/ \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    systemctl status docker
fi

# 检查docker命令是否存在，如果不存在则安装Docker 
if command -v mysql > /dev/null; then
    echo "mysql客户端已安装"
else
    echo "mysql客户端命令未找到，正在尝试安装..."  
    sudo apt-get update  # 更新包列表  
    sudo apt-get install -y mysql-client  # 安装依赖包
fi

echo "开始安装MySql镜像"  
sudo docker run --name crossgate_mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=$db_password -d mysql:5.7.38
echo "等待MySql镜像启动"
sleep 10s
echo "开始导入数据库文件"  
mysql --defaults-file=./mysql.ini<crossgate.sql


echo "开始安装Web镜像"
sudo docker run -d --name crossgate_web -p 80:80 -v "$SCRIPT_DIR/wwwroot/:/var/www/html" germanramos/nginx-php-fpm:v5.6.21



echo "开始保存数据库配置信息"
sudo sed -i '8s/.*/dbservname='$db_host'/' gmsv/setup.cf
sudo sed -i '12s/.*/dbpassword='$db_password'/' gmsv/setup.cf
sudo sed -i '5s/.*/$connect=mysql_connect("'$db_host'","'$db_user'","'$db_password'") or die();/' wwwroot/lib.php
sudo sed -i '6s/.*/mysql_select_db("'$db_name'");/' wwwroot/lib.php

echo "开始启动CrossGate服务"
sudo sudo docker run -d --name crossgate --workdir /gmsv -p 9030:9030 -v "$SCRIPT_DIR/gmsv/:/gmsv/" scottyhardy/docker-wine:stable-9.0 wine "cgmsv.exe" 

echo "命令已全部执行完成，请检查Docker容器运行状态"