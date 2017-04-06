# Playbook: MySQL Server ( 5.6.35 || 5.7.17 )

This playbook can do the following:
* Setup a dedicated volume for mysql databases.
* Deploy MysQL server versions: 5.6.35 or 5.7.17 (latest GA release)
   * In the hosts file specify group `[mysql56]` or `[mysql57]` for selected hosts.

## Details
* Please override the role defaults.  See the `deploy-mysql.yml.example`.
   * The `storage-mysql` has defaults specified for the disks, and volume setup.
* The `service-mysql` role creates the following users:
   * `admin@'%'` for DBA access.
   * `nagios@'%'` for monitoring access.
* The `service-mysql` role has a barebones my.cnf file.  It is found in the `templates` folder.
* The `service-mysql` role has an `rpms` folder.
   * Execute the `get_rpms.sh` to retrieve the rpms from MySQL repo.

## Example deploy.yml
```
---
- name: Deploying MySQL 5.7.17
  hosts: mysql57
  roles:
    -
        name: storage-mysql
        mysql_disks: /dev/sdb,/dev/sdc,/dev/sdd,/dev/sde
        mysql_lv_size: 10G
        lv_stripe_count: 4
        lv_stripe_size: 128
    -
        name: service-mysql
        mysql_version: 5.7.17
        mysql_root_password: root!pass
        mysql_admin_password: admin!pass
        mysql_nagios_password: nagios!pass
    -
        name: bench-mysql
 ```

## Roles Tree
```
roles/
├── bench-mysql
│   └── tasks
│       └── main.yml
├── service-mysql
│   ├── defaults
│   │   └── main.yml
│   ├── rpms
│   │   ├── 5.6.35
│   │   ├── 5.7.17
│   │   ├── get_rpms.sh
│   │   ├── MySQL-5.6.35-1.el7.x86_64.rpm-bundle.tar
│   │   └── mysql-5.7.17-1.el7.x86_64.rpm-bundle.tar
│   ├── tasks
│   │   ├── main.yml
│   │   ├── mysql-56.yml
│   │   └── mysql-57.yml
│   ├── templates
│   │   └── my.cnf.j2
│   └── vars
│       ├── 5.6.35.yml
│       └── 5.7.17.yml
└── storage-mysql
    ├── defaults
    │   └── main.yml
    └── tasks
        └── main.yml
```
