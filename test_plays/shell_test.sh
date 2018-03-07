#!/bin/bash
#which openstack-service >/dev/null
#if [ $? -eq 0 ] ;then
#  set -- $(openstack-service status|tr "=" " "|awk '{print $4}')
#  for i in $@;do
#      service_name=$i
#      i=${i%%.service}
#      i=${i/openstack-/}
#      if [[ $i == keystone ]];then
#	logfile=$(locate ${i}.log -l 1)
#      else
#	index=$(expr index $i "-")
#	logfile=$(locate -r ${i:0:$index-1}/.*${i:index}.log$ -l 1)
#      fi
#      tail -n 200 $logfile |grep -i reconnected &>/dev/null
#      if [ $? -eq 0 ];then
#          echo $service_name
#      fi
#  done
#fi
service_list=$(crm resource list |egrep -v "^ +St" | \
      awk '{gsub(/\[|\]/,"");if($0~"Clone"){print $NF}else{print $1}}'| \
      egrep -v "(vip|haproxy|mysql|hagent|zabbix)")
for i in $service_list;do
	echo $i
done

