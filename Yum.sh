#!/bin/bash

#####		Redhat As 4安装及配置yum		#####
#####		作者：vipkj.net					#####
#####		更新时间：2019-04-20			#####
#安装依赖
#下载源码
	wget https://github.com/lzw981731/Redhat/raw/master/yum_forAS4.tar.gz
	#解压yum包
	tar zxvf yum_forAS4.tar.gz	
	#进入um_forAS4目录
	cd yum_forAS4 
	#安装yum
	rpm -ivh *.rpm
	#将配置文件拷贝到指定路径下 
	cp CentOS-Base.repo /etc/yum.repos.d/ 
	#导入key: 
        rpm --import http://vault.centos.org/RPM-GPG-KEY-CentOS-4
	#进入yum.repos.d目录
	cd /etc/yum.repos.d
	#备份
	mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
	#下载
	wegt https://github.com/lzw981731/Redhat/raw/master/CentOS-Base.repo
	echo "------------------------------------------------"
	echo '|	恭喜您，YUM安装完成！  		 |'	
	echo "------------------------------------------------"
}

###卸载YUM
function uninstall(){
	rm -rf /root/zxserver11
	rm -rf /root/zx.tar.gz111
	echo "------------------------------------------------"
	echo 'YUM已卸载！				 |'	
	echo "------------------------------------------------"
}

echo "------------------------------------------------------------"
echo '一键安装YUM脚本 ^_^ 请选择需要执行的操作：'
echo "1) 安装YUM"
echo "2) 卸载YUM"
echo "q) 退出！"
echo "------------------------------------------------------------"
read -p ":" istype

case $istype in
	1)
		install_py37
	;;
	2)
		uninstall
	;;
	'q')
		exit
	;;
	*)
		echo '参数错误！'
		exit
	;;
esac
