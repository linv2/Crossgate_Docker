#!/bin/bash  
  
# 获取脚本的完整路径  
REAL_SCRIPT_PATH="$(readlink -f "$0")"  
# 提取脚本所在的目录  
SCRIPT_DIR="$(dirname "$REAL_SCRIPT_PATH")"  

# 检查docker命令是否存在，如果不存在则安装Docker 
if command -v docker &> /dev/null; then
    echo "docker已安装"
else
    echo "docker命令未找到，正在尝试安装..."  
    sudo apt-get update  # 更新包列表  
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common  # 安装依赖包  
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -  # 添加Docker官方GPG密钥  
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"  # 添加Docker官方源  
    sudo apt-get update  # 再次更新包列表以确保Docker源生效  
    sudo apt-get install docker-ce docker-ce-cli containerd.io  # 安装Docker CE  
    sudo systemctl start docker  # 启动Docker服务  
fi  
  


  
CONTAINER_NAME="corssgate"  
while true
do 

CONTAINER_STATUS=$(sudo docker ps -a --filter "name=$CONTAINER_NAME" --format "{{.Status}}")  
  
if [ -z "$CONTAINER_STATUS" ]; then  
    echo "容器 $CONTAINER_NAME 未运行"
elif [[ "$CONTAINER_STATUS" == *"Up"* ]]; then  
    echo "容器 $CONTAINER_NAME 正在运行"  
else  
    echo "容器 $CONTAINER_NAME 已停止"
fi
CONTAINER_NAME="corssgate" 
echo "请输入你的操作后回车确认："
echo "1、初始化"
echo "2、启动"
echo "3、停止"
echo "4、删除"
echo "5、退出"
read input
case $input in
    1)
       sudo sudo docker run -d --name $CONTAINER_NAME --workdir /gmsv -p 9030:9030 -v "$SCRIPT_DIR/gmsv/:/gmsv/" mtapiio/wine8 wine "cgmsv.exe" 
    ;; 
    2)
       sudo docker start $CONTAINER_NAME
    ;; 
    3)
       sudo docker stop $CONTAINER_NAME
    ;; 
    4)
    
       sudo docker rm $CONTAINER_NAME
    ;; 
    5)
     exit;
    ;; 
esac
done