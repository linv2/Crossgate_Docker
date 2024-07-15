# Crossgate_Docker
魔力宝贝服务端Docker镜像/容器
> github地址 [https://github.com/linv2/Crossgate_Docker](https://github.com/linv2/Crossgate_Docker)
> 
> gitee地址 [https://gitee.com/linv2/Crossgate_Docker](https://gitee.com/linv2/Crossgate_Docker)

# 写在前边的话
魔力多年老玩家，最近在网上找到很多，没有找到合适的Linux服务端。大部分都是Windows的两键端，但是做为服务器的话，Windows占用的资源太高了，配置高的机器又太贵了，所以一直想要用Linux的服务端，可是找了很久都无果。
偶然间想到以前用Windows做主机，用Centos虚拟机做服务器，反过来是否可行，正好想到Linux端有Wine，所以就尝试了下，发现可行，就分享出来，以前没用过Shell脚本,在文心一言的帮助下完成，可能有BUG。作为程序员，把原始的私服服务端和互联网技术结合了，也算个小创新了。
理论上支持x86架构的NAS

采用cgmsv官方服务端和data，包含mysql,php,wine容器。启动后内存占用2G左右，如果自己有其他的服务器可以不安装mysql和web镜像，降低内存占用。
mysql版本采用5.7,mysql 9.0版本服务端程序无法连接，其他版本未测试。
另外data数据也影响内存的占用

# 服务端
[服务端来自cgmsv官网](https://www.cgmsv.com/)
- 准备服务器，示例中使用Ubuntu 22.04
- 服务端开启22,80,9030端口
- 检查是否安装git客户端，未安装的话 `sudo apt install -y git` 进行安装
- 选择一个合适的仓库地址，找到一个自己喜欢的目录下载代码，
  > `git clone https://github.com/linv2/Crossgate_Docker.git`

  > `git clone https://gitee.com/linv2/Crossgate_Docker.git`
- 进入项目文件夹`cd Crossgate_Docker`
- 安装全部依赖项`sh Install.sh`
- 等待安装完成

# 客户端
[客户端来自cgmsv论坛](https://down.cgmsv.com/cgtw_7.1_20220101.7z)
- 下载客户端  
- 解压客户端  
- 下载登录器   
- 解压登录器至客户端目录               
- 修改登录器配置文件`cgmsv.ini`         
    > 第4行 `ServerList=IP:0:127.0.0.1:9030`

    > 把127.0.0.1 修改为自己的服务器IP
- 浏览器打开`http://服务器IP`注册账号
- 打开`登陆器.exe`进行游戏
