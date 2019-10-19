有录 ssh
修改/etc/rinetd.conf 修改你要加速的内网端口
修改 /etc/supervisord.d/process.conf 你要加速的组
然后执行
 supervisord -d /etc/supervisord.conf
