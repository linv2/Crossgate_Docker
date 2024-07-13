#!/bin/bash  
echo "请输入数据库地址";
read db_host;
echo "请输入数据库名";
read db_name;
echo "请输入数据库用户名";
read db_user;
echo "请输入数据库密码";
read db_password;
sed -i '5s/.*/$connect=mysql_connect("'$db_host'","'$db_user'","'$db_password'") or die();/' wwwroot/lib.php
sed -i '6s/.*/mysql_select_db("'$db_name'");/' wwwroot/lib.php
sed -i '8s/.*/dbservname='$db_host'/' gmsv/setup.cf
sed -i '10s/.*/dbusername='$db_user'/' gmsv/setup.cf
sed -i '12s/.*/dbpassword='$db_password'/' gmsv/setup.cf
sed -i '14s/.*/dbdatabasename='$db_name'/' gmsv/setup.cf
echo "数据库信息已替换"