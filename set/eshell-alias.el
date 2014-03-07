alias cdfx cd /ssh::/home/fx
alias rm1 /bin/mv1 --verbose -f --backup=numbered --target-directory /home/.trash/
alias bc bc -l
alias vfpm find-file /etc/php5/fpm/pool.d/www.conf
alias vphp find-file /etc/php5/fpm/php.ini
alias cdku cd /fo/ku
alias vimq find-file /fo/q
alias vimfo find-file /fo/fo
alias cdfo cd /fo/doc
alias vf cd /fo/doc;./z.sh
alias vl find-file /doc/lisp
alias vimtodo find-file /doc/todo
alias vimpy find-file /doc/py
alias t find-file /doc/tip
alias vimtip find-file /doc/tip
alias vr find-file /doc/ruby
alias vimwork find-file /srv/data
alias cdwork cd /srv/data
alias vimclass find-file /srv/class
alias cdclass cd /srv/class
alias vimphp find-file /srv/cli
alias cdphp cd /srv/cli
alias cdspider cd /srv/cli/spider
alias vimsphinx find-file /etc/sphinxsearch/sphinx.conf
alias vimnginx1 find-file /opt/nginx/conf/nginx.conf
alias vimnginx find-file /etc/nginx/nginx.conf
alias vimrc find-file /root/.vimrc
alias sb source /root/.bashrc
alias vb find-file /root/.bashrc
alias sourcebashrc source /root/.bashrc
alias vimbashrc find-file /root/.bashrc
alias vimss find-file /doc/scrapy
alias vims find-file /doc/sphinx
alias vimgz find-file /srv/gz
alias cdgz cd /srv/gz
alias cdtest cd /srv/test/
alias cdout cd /home/test/out
alias cdjob cd /home/test/job/job/spiders/
alias cdhelp cd /srv/help
alias cdjs cd /srv/js
alias vimtool find-file /srv/tool
alias cdtool cd /srv/tool
alias cdfz cd /srv/lisp/fz
alias cl cd /srv/lisp
alias kff killall -9 firefox
alias kf killall -9 npviewer.bin
alias umnt_log umount /home/src/log
alias mnt_log sshfs root@192.168.1.101:/home/src/log /home/src/log;
alias mount_usbbb mount -o iocharset=utf8 /dev/sdb1 /mnt/usb
alias mount_usbb mount -t vfat -o iocharset=utf8 /dev/sdb1 /mnt/usb
alias mount_usb1 mount -t vfat -o iocharset=utf8 /dev/sdd /mnt/usb
alias mount_usb mount -t vfat -o iocharset=utf8 /dev/sdc /mnt/usb
alias mount_r mount -t ext4 /dev/sda2 /mnt/r
alias mount_e mount -t ext3 /dev/sda5 /mnt/d
alias mount_c mount -t vfat -o iocharset=utf8 /dev/sda1 /mnt/c
alias mysqlsla1 mysqlsla -lt slow
alias vimsql find-file /var/db/mysql/www-slow.log
alias mysql mysql -A 
alias tomcat6 /etc/init.d/tomcat6
alias memcached /etc/init.d/memcached
alias mysqld /etc/init.d/mysql
alias php-fpm /etc/init.d/php5-fpm
alias sphinx /etc/init.d/sphinxsearch
alias nginx1 /opt/nginx/init
alias nginx /etc/init.d/nginx
alias j jobs -l
alias p3 ping 60.190.223.201
alias p2 ping 60.190.223.195
alias p1 ping 60.190.223.163
alias p ping -n www.baidu.com
alias h history 25
alias py ipython
alias pr '/srv/cli/pr/page_rank.pl \!*
alias iptablesrestart /sbin/iptables-restore < /etc/iptables.up.rules
alias sftpl3 sshpass -p 'ku' sftp root@192.168.1.10
alias sshl3 sshpass -p 'ku' ssh 192.168.1.10
alias sftpl2 sshpass -p 'yao' sftp root@192.168.1.101
alias sshl2 sshpass -p 'yao' ssh -l root 192.168.1.101
alias pl2 ping 192.168.1.101
alias sftp3 sshpass -p 'jswHnRmc9o' sftp -oPort=35072 yao@60.190.223.59
alias sftp2 sshpass -p 'jswHnRmc9o' sftp -oPort=54872 yao@60.190.223.45
alias sftp1 sshpass -p 'jswHnRmc9o' sftp -oPort=2746 yao@60.190.223.163
alias ssh3 sshpass -p 'jswHnRmc9o' ssh -l yao -p 35072 -o ServerAliveInterval=60 60.190.223.59
alias ssh2 sshpass -p 'jswHnRmc9o' ssh -l yao -p 54872 -o ServerAliveInterval=60 60.190.223.45
alias ssh1 sshpass -p 'jswHnRmc9o' ssh -l yao -p 2746 -o ServerAliveInterval=60 60.190.223.163
alias du1 du -h --max-depth=1
alias tel telnet 127.0.0.1 11211
alias n4 netstat -nat|grep -i "8080"|wc -l
alias n3 netstat -nat|grep -i "80"|wc -l
alias n22 netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
alias n2 netstat -atn | grep 'SYN\|WAIT' | awk '{print $5}' | awk -F':' '{print $1}' | sort -nr | uniq -c | sort -nr | head
alias n1 netstat -n | awk '/^tcp/ {++S[\$NF]} END {for(a in S) print a,S[a]}
alias w1 tail /mnt/r/home/src/os/wget-log
alias vim find-file $1
alias ec find-file $1
alias e find-file $1
alias ee find-file $1
alias emacs find-file $1
alias g grep --color -ri
alias grep grep --color
alias tree tree -C
alias wc wc --chars
alias g grep -nH -e $*
alias la ls $*
alias l ls -l $*
alias ll ls -l $*
