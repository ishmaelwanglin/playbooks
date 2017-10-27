#!/bin/bash
# description: create ansible role's directory

set +x 
set -e
test $# -ne 1 && (echo "Input rolename,Please." ; exit)
basepath=$(cd `dirname $0`; pwd)
test ! -d ${basepath}/roles && mkdir roles
rolename=$1
rolepath=$basepath/roles/$rolename
test ! -d $rolepath && mkdir -p $rolepath/{default,tasks,vars,meta,hanlders,templates,files} ||  \
echo "Warn: $rolename is exist!"
if [ $? -eq 0 ];then
	for d in meta vars tasks default hanlders;do
		touch $rolepath/$d/main.yml
	done
fi
