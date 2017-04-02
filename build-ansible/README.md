# Playbook: Build Latest Stable Ansible RPMs

## Pre-reqs: 
- Find a suitable CentOS 7 server with Ansible ready.
- Easily ssh-able, if not `ssh-copy-id root@node-00`.

## Configuration:
- You can update the version and other parameters in `vars/common.yml` file.
- You can create the hosts file, use `hosts.example` as a basis.

## Run:
- `ansible-playbook -i hosts ansible-build.yml`

## Output:
```
[root@ansible-00 ansible-build]# ansible-playbook -i hosts ansible-build.yml

PLAY [all] ***********************************************************************************

TASK [Gathering Facts] ***********************************************************************
ok: [node-00]

TASK [Checking for CentOS] *******************************************************************
skipping: [node-00]

TASK [Loading common variables] **************************************************************
ok: [node-00]

TASK [Loading CentOS variables] **************************************************************
ok: [node-00]

TASK [Getting helper packages] ***************************************************************
ok: [node-00] => (item=[u'epel-release', u'git', u'python-jinja2', u'PyYAML', u'asciidoc-doc', u'python-sphinx', u'rpm-build', u'python2-devel'])

TASK [Making /opt/software folder] ***********************************************************
ok: [node-00]

TASK [Cloning git repo: https://github.com/ansible/ansible.git to /opt/software/ansible] *****
ok: [node-00]

TASK [Building ansible stable-2.3] ***********************************************************
changed: [node-00]

PLAY RECAP ***********************************************************************************
node-00                   : ok=7    changed=1    unreachable=0    failed=0
```
