```shell
nic@jump:~/shared/ansible/split_filter$ pip3 list
Package                Version
---------------------- --------------
ansible                5.7.1
ansible-core           2.12.5
jmespath               1.0.0
```
```shell
nic@jump:~/shared/ansible/split_filter$ ansible-playbook split_filter.yml -e @avi_yaml_values.yml
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [localhost] ************************************************************************************************************************************************************

TASK [filter network address] ***********************************************************************************************************************************************
ok: [localhost] => {
    "msg": "100.64.133.0"
}

TASK [filter network prefix] ************************************************************************************************************************************************
ok: [localhost] => {
    "msg": "24"
}

PLAY RECAP ******************************************************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

nic@jump:~/shared/ansible/split_filter$

```