# HOW-TO:  MySQL 5.6.35 and MySQL 5.7.17 Deployment

This playbook will do the following:
* It can create a dedicated volume for /var/lib/mysql
    * You can define custom volume properties by overriding the `storage-mysql` role defaults.  See the deploy example script for ways to override.
* It can create a clean install of MySQL version 5.6.35 or 5.7.17.
    * You can decide which version by placing your host in the appropriate host group. `[mysql56]` or `[mysql57]`.
* It places a *templatized* copy of my.cnf in /var/lib/mysql and symlinks to /etc/my.cnf
* It places a copy of root account information in the /root/.my.cnf for easy access to the MySQL shell.
* It will perform the following MySQL account operations:
    * Update all root passwords to be consistent
    * Remove root@'::1' user account
    * Remove anonymouns user accounts
    * Add admin@'%' user for *application owner* access
    * Add nagios@'%' user for monitoring access

Notes:
* In the service-mysql roles folder, there is a rpm folder.  Execute the `get_rpms.sh` to retrieve the rpms from MySQL repo.
