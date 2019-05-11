#!/bin/bash
#下载安装包
wget https://github.com/jlw345/DenyHosts/raw/master/DenyHosts-2.6.tar.gz
#解压源码包
tar zxvf DenyHosts-2.6.tar.gz
#进入安装解压目录
cd DenyHosts-2.6
#安装DenyHosts
python setup.py install
#下载配置文件
wget https://raw.githubusercontent.com/jlw345/DenyHosts/master/denyhosts.cfg
#移动配置文件
mv denyhosts.cfg /usr/share/denyhosts/denyhosts.cfg
#默认安装路径
cd /usr/share/denyhosts/
#daemon-control为启动程序
cp daemon-control-dist daemon-control
#添加root权限
chown root daemon-control
#修改为可执行文件
chmod 700 daemon-control
#对daemon-control进行软连接，方便管理
ln -s /usr/share/denyhosts/daemon-control /etc/init.d
#启动denyhosts
/etc/init.d/daemon-control start
#将denghosts设成开机启动
chkconfig daemon-control on
echo “done”
echo “完成”
