#!/bin/bash
#���ذ�װ��
wget https://github.com/jlw345/DenyHosts/raw/master/DenyHosts-2.6.tar.gz
#��ѹԴ���
tar zxvf DenyHosts-2.6.tar.gz
#���밲װ��ѹĿ¼
cd DenyHosts-2.6
#��װDenyHosts
python setup.py install
#���������ļ�
wget https://raw.githubusercontent.com/jlw345/DenyHosts/master/denyhosts.cfg
#�ƶ������ļ�
mv denyhosts.cfg /usr/share/denyhosts/denyhosts.cfg
#Ĭ�ϰ�װ·��
cd /usr/share/denyhosts/
#daemon-controlΪ��������
cp daemon-control-dist daemon-control
#���rootȨ��
chown root daemon-control
#�޸�Ϊ��ִ���ļ�
chmod 700 daemon-control
#��daemon-control���������ӣ��������
ln -s /usr/share/denyhosts/daemon-control /etc/init.d
#����denyhosts
/etc/init.d/daemon-control start
#��denghosts��ɿ�������
chkconfig daemon-control on
echo ��done��