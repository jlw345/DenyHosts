# DenyHosts
DenyHosts（项目主页：http://denyhosts.sourceforge.net/） 是运行于Linux上的一款预防SSH暴力破解的软件，可以从http://sourceforge.net/projects/denyhosts/files/ 进行下载，然后将下载回来的DenyHosts-2.6.tar.gz源码包上传到Linux系统中。
可一键安装或手动安装
****************************************************************
①直接运行一键脚本

wget -N --no-check-certificate https://raw.githubusercontent.com/jlw345/DenyHosts/master/denyhosts.sh && chmod +x denyhosts.sh && ./denyhosts.sh
****************************************************************
****************************************************************
②以下是手动安装
`wget https://github.com/jlw345/DenyHosts/raw/master/DenyHosts-2.6.tar.gz`   #下载安装包

`tar zxvf DenyHosts-2.6.tar.gz`                                              #解压源码包

`cd DenyHosts-2.6`                                                            #进入安装解压目录

`python setup.py install`                                                    #安装DenyHosts

`cd /usr/share/denyhosts/`                                                  #默认安装路径

`cp denyhosts.cfg-dist denyhosts.cfg`                                    #denyhosts.cfg为配置文件

`cp daemon-control-dist daemon-control`                                #daemon-control为启动程序

`chown root daemon-control`                                           #添加root权限

`chmod 700 daemon-control`                                            #修改为可执行文件

`ln -s /usr/share/denyhosts/daemon-control /etc/init.d`         #对daemon-control进行软连接，方便管理安装到这一步就完成了。

`/etc/init.d/daemon-control start`             #启动denyhosts

`chkconfig daemon-control on`                  #将denghosts设成开机启动
******************************************************************
vi /usr/share/denyhosts/denyhosts.cfg    

#编辑配置文件，另外关于配置文件一些参数，通过grep -v "^#" denyhosts.cfg查看

SECURE_LOG = /var/log/secure     

#ssh 日志文件，redhat系列根据/var/log/secure文件来判断；Mandrake、FreeBSD根据 /var/log/auth.log来判断

 #SUSE则是用/var/log/messages来判断，这些在配置文件里面都有很详细的解释。
 
HOSTS_DENY = /etc/hosts.deny                 #控制用户登陆的文件

PURGE_DENY = 30m                             #过多久后清除已经禁止的，设置为30分钟；

‘m’ = minutes

‘h’ = hours

‘d’ = days

‘w’ = weeks

‘y’ = years

BLOCK_SERVICE = sshd                           #禁止的服务名，当然DenyHost不仅仅用于SSH服务

DENY_THRESHOLD_INVALID = 1                     #允许无效用户失败的次数

DENY_THRESHOLD_VALID = 3                       #允许普通用户登陆失败的次数

DENY_THRESHOLD_ROOT = 3                        #允许root登陆失败的次数

DAEMON_LOG = /var/log/denyhosts                #DenyHosts日志文件存放的路径，默认

RESET_ON_SUCCESS = yes                         #如果一个ip登陆成功后，失败的登陆计数是否重置为0

更改DenyHosts的默认配置之后，重启DenyHosts服务即可生效: 

`/etc/init.d/daemon-control restart`             #重启denyhosts
