#!/bin/bash 

sudo docker stop crossgate
sudo docker stop crossgate_web
sudo docker stop crossgate_mysql

sudo docker rm crossgate
sudo docker rm crossgate_web
sudo docker rm crossgate_mysql

echo "清理已完成"