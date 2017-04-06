# HOW-TO:  MySQL 5.6.35 and MySQL 5.7.17 Deployment

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
