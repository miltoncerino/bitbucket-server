# bitbucket-server

https://medium.com/@niko.huber/dockerizing-bitbucket-server-d07404eefc51

back up bitbucket and postgres:
https://confluence.atlassian.com/bitbucketserver/using-bitbucket-server-diy-backup-776640056.html

migration:
https://confluence.atlassian.com/bitbucketserver/bitbucket-server-upgrade-guide-776640551.html

1. create a backup of your currently running Bitbucket Server

To create a backup of your currently running Bitbucket server, follow the standard procedure described in Atlassians Bitbucket Server DIY Backup (https://confluence.atlassian.com/bitbucketserver/using-bitbucket-server-diy-backup-776640056.html). Basically, you have to download their scripts, adjust the settings to your environment and execute the script. As a result, you should get an archive containing your repositories together with a database dump (in our case Postgres).

2. create new Docker data volumes for your new Bitbucket Server and Postgres data
3. import the data to those containers
4. run the service with Docker compose