command to test hosts:

"ansible -i hosts all -m ping"

output: 

"[WARNING]: Platform linux on host worker02 is using the discovered Python interpreter at /usr/bin/python3.9, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible/2.10/reference_appendices/interpreter_discovery.html for more information.
worker02 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.9"
    },
    "changed": false,
    "ping": "pong"
}
[WARNING]: Platform linux on host worker01 is using the discovered Python interpreter at /usr/bin/python3.9, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible/2.10/reference_appendices/interpreter_discovery.html for more information.
worker01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.9"
    },
    "changed": false,
    "ping": "pong"
}
[WARNING]: Platform linux on host master is using the discovered Python interpreter at /usr/bin/python3.9, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible/2.10/reference_appendices/interpreter_discovery.html for more information.
master | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.9"
    },
    "changed": false,
    "ping": "pong"
}
"
-----------------------------------------

command to create kube + add kube to sudo + copy key (useless)
their is some config to do before, i already use ssh so i had to give at my user 'alka' the sudo write without password

"ansible-playbook -i hosts users.yml" add "-vvv" for errros

output:

PLAY [workers, masters] *******************************************************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************************************************
[WARNING]: Platform linux on host master is using the discovered Python interpreter at /usr/bin/python3.9, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible/2.10/reference_appendices/interpreter_discovery.html for more information.
ok: [master]
[WARNING]: Platform linux on host worker02 is using the discovered Python interpreter at /usr/bin/python3.9, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible/2.10/reference_appendices/interpreter_discovery.html for more information.
ok: [worker02]
[WARNING]: Platform linux on host worker01 is using the discovered Python interpreter at /usr/bin/python3.9, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible/2.10/reference_appendices/interpreter_discovery.html for more information.
ok: [worker01]

TASK [create the kube user account] *******************************************************************************************************************************************************************************
[WARNING]: 'append' is set, but no 'groups' are specified. Use 'groups' for appending new groups.This will change to an error in Ansible 2.14.
ok: [master]
ok: [worker01]
ok: [worker02]

TASK [allow 'kube' to use sudo without needing a password] ********************************************************************************************************************************************************
ok: [worker02]
ok: [master]
ok: [worker01]

TASK [set up authorized keys for the kube user] *******************************************************************************************************************************************************************
changed: [worker02] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDK+luW483Aj3/hi4gqgE7/jcvEt8vSoQNrofwrGO1AjMb1UAFVxeeGu+A6O/BxStuo3VLuwUiVXZ/ezcaXRdn7zAnY0er66ptuoAdtW9znOrBeVoeOiLOhtC7hFwMG9nnQ3jm9DeKb2XHMl1QDnuH/AN4efiLDwgcHkwh1I81YJBQuT8jC0V2+Etk3C5rTRS04Aya5lpD8IV6GQfUeyuSq4ZcUnVLzCBQzvqjPcd/lC5IWQPBrHV0kvCSWiaUm10SqBKQFXs4xVolF4SItWdGHB2vM4RDlhcVAINzF3gUKZ7PQvRGNb+7pddJKHnnrsKiO8c/LIqRzas0iUxljxa6CZHSUo5aIohyuI8ciKa1Dyh4ROpSYCxFeMFaXlhr/ZDu2SEp5h2m+RQT0jgbTmXawWuBnAVcFnwrRPsXtDHbUcj6aIyrXY/3PqAhvZdNoai7mePf8RcVR8I4ZqMbzNLO2Om7OEtcMeLct5tcsVxAJQoT6u9MDptyJO18oWp3dX8M= alka@master)
changed: [master] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDK+luW483Aj3/hi4gqgE7/jcvEt8vSoQNrofwrGO1AjMb1UAFVxeeGu+A6O/BxStuo3VLuwUiVXZ/ezcaXRdn7zAnY0er66ptuoAdtW9znOrBeVoeOiLOhtC7hFwMG9nnQ3jm9DeKb2XHMl1QDnuH/AN4efiLDwgcHkwh1I81YJBQuT8jC0V2+Etk3C5rTRS04Aya5lpD8IV6GQfUeyuSq4ZcUnVLzCBQzvqjPcd/lC5IWQPBrHV0kvCSWiaUm10SqBKQFXs4xVolF4SItWdGHB2vM4RDlhcVAINzF3gUKZ7PQvRGNb+7pddJKHnnrsKiO8c/LIqRzas0iUxljxa6CZHSUo5aIohyuI8ciKa1Dyh4ROpSYCxFeMFaXlhr/ZDu2SEp5h2m+RQT0jgbTmXawWuBnAVcFnwrRPsXtDHbUcj6aIyrXY/3PqAhvZdNoai7mePf8RcVR8I4ZqMbzNLO2Om7OEtcMeLct5tcsVxAJQoT6u9MDptyJO18oWp3dX8M= alka@master)
changed: [worker01] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDK+luW483Aj3/hi4gqgE7/jcvEt8vSoQNrofwrGO1AjMb1UAFVxeeGu+A6O/BxStuo3VLuwUiVXZ/ezcaXRdn7zAnY0er66ptuoAdtW9znOrBeVoeOiLOhtC7hFwMG9nnQ3jm9DeKb2XHMl1QDnuH/AN4efiLDwgcHkwh1I81YJBQuT8jC0V2+Etk3C5rTRS04Aya5lpD8IV6GQfUeyuSq4ZcUnVLzCBQzvqjPcd/lC5IWQPBrHV0kvCSWiaUm10SqBKQFXs4xVolF4SItWdGHB2vM4RDlhcVAINzF3gUKZ7PQvRGNb+7pddJKHnnrsKiO8c/LIqRzas0iUxljxa6CZHSUo5aIohyuI8ciKa1Dyh4ROpSYCxFeMFaXlhr/ZDu2SEp5h2m+RQT0jgbTmXawWuBnAVcFnwrRPsXtDHbUcj6aIyrXY/3PqAhvZdNoai7mePf8RcVR8I4ZqMbzNLO2Om7OEtcMeLct5tcsVxAJQoT6u9MDptyJO18oWp3dX8M= alka@master)

PLAY RECAP ********************************************************************************************************************************************************************************************************
master                     : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
worker01                   : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
worker02                   : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
"

-----------------------------------------------------------


