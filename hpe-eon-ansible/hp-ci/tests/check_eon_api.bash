#!/bin/bash
#
# (c) Copyright 2015-2017 Hewlett Packard Enterprise Development Company LP
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#

source ~/service.osrc

TOKEN=$(openstack token issue | grep -w id | awk '{print $4}')

EON_ENDPOINT=$(openstack endpoint list --service esx_onboarder --interface internal -f value -c URL)

curl -i -X GET -H "X-Auth-Token: $TOKEN" -H "Content-Type: application/json" -H "Accept: application/json" -H "'User-Agent: eon-ci-test" "$EON_ENDPOINT/v2/resources"

if [ $? -eq 0 ]; then
   echo "EON API is up and running.."
   exit 0
else
   echo "Failed to connect EON-API"
  exit 1
fi
