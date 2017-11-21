1、 获取每个节点的hostname
2、 获取控制节点的数量
3、 创建日志文件在本地/var/log/escloud_check/esck*
4、 检查节点的内存free值，小于9G报警
5、 检查内存剩余比例，可用内存低于10%报警
6、 检查每个节点的管理网IP是否通畅
7、 在控制节点上检查mysql数据库端口3307是否可以访问
8、 检查mysql二进制日志空间站用大于10G报警
9、 检查ceph集群的健康状态
10、 检查OSD状态，记录down的OSD
11、 检查compute节点的服务状态： libvirt nova-compute neutron-openv
12、 检查控制节点的服务状态
13、 检查crm集群online的节点数是否与控制节点数一致
14、 检查rabbitmq集群running节点数是否与控制节点数一致
15、 检查mongodb的进程占用内存，大于10G或者20%报警
16、 检查Mysql的内存占用比例，大于10G或者10%报警
17、 检查根目录的空间使用比例，大于80%报警（与ceph的70%冲突）
18、 检查mongodb挂载点的空间占用比例，大于80%报警
19、 检查/var/lib/nova挂载点磁盘空间占用比例，大于80%报警
20、 检查每个OSD节点的OSD磁盘空间，大于80%报警
21、 v1.3新增磁盘故障检测和磁盘文件系统故障
22、 sgcc版本增加curl获取vip页面及socket页面状态的功能,以及获取控制节点public ip和获取集群vip的功能
