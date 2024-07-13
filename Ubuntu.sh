#!/bin/bash  
  
# 获取脚本的完整路径  
REAL_SCRIPT_PATH="$(readlink -f "$0")"  
# 提取脚本所在的目录  
SCRIPT_DIR="$(dirname "$REAL_SCRIPT_PATH")"  

# 检查docker命令是否存在，如果不存在则安装Docker  
if ! command -v docker &> /dev/null; then  
    echo "docker命令未找到，正在尝试安装..."  
    sudo apt-get update  # 更新包列表  
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common  # 安装依赖包  
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -  # 添加Docker官方GPG密钥  
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"  # 添加Docker官方源  
    sudo apt-get update  # 再次更新包列表以确保Docker源生效  
    sudo apt-get install docker-ce docker-ce-cli containerd.io  # 安装Docker CE  
    sudo systemctl start docker  # 启动Docker服务  
fi  
  
# 使用Docker运行容器，挂载文件到容器内，并运行cgmsv.exe  
sudo docker run -it --name corssgate --workdir /gmsv -p 9030:9030 -v "$SCRIPT_DIR/gmsv/:/gmsv/" mtapiio/wine8 wine "cgmsv.exe" 