# bitbucket-server

## FIRST-TIME DEPLOYMENT
### Deploy using
```
. deploy.sh
```

### Destroy using
```
. destroy.sh
```
## USAGE
### Use it by opening
```
http://localhost:7990
```

### Port forwarding (in case of using a remote server). Run cmd and
```
ssh -L 7990:localhost:7990 <USER>@<SERVER>
```

### Setup
When setting up Bitbucket, use the container ID when asked for the hostname the DB is running on, e.g. f01c04948507 in the following example:
```
CONTAINER ID        IMAGE                               COMMAND                  CREATED             STATUS              PORTS                                            NAMES
b53b97fd70c6        atlassian/bitbucket-server:latest   "/sbin/tini -- /entr…"   9 hours ago         Up 1 second         0.0.0.0:7990->7990/tcp, 0.0.0.0:7999->7999/tcp   bitbucket
f01c04948507        postgres:latest                     "docker-entrypoint.s…"   9 hours ago         Up 1 second         0.0.0.0:5432->5432/tcp                           bitbucket-database
```
## BACKUP A RUNNING INSTANCE
1. Download the "Atlassians Bitbucket Server DIY Backup" script
2. Adjust the settings to your environment
3. Execute the script (you should get an archive containing your repositories together with a database dump)


1. create a backup of your currently running Bitbucket Server

To create a backup of your currently running Bitbucket server, follow the standard procedure described in Atlassians Bitbucket Server DIY Backup (https://confluence.atlassian.com/bitbucketserver/using-bitbucket-server-diy-backup-776640056.html). Basically, you have to download their scripts, adjust the settings to your environment and execute the script. As a result, you should get an archive containing your repositories together with a database dump (in our case Postgres).

2. create new Docker data volumes for your new Bitbucket Server and Postgres data
3. import the data to those containers
4. run the service with Docker compose

## SOURCES
deploy, backup and restore:
https://medium.com/@niko.huber/dockerizing-bitbucket-server-d07404eefc51

link between bitbucket and postgres:
https://github.com/jmillxyz/docker-bitbucket-postgres

back up bitbucket and postgres:
https://confluence.atlassian.com/bitbucketserver/using-bitbucket-server-diy-backup-776640056.html

migration:
https://confluence.atlassian.com/bitbucketserver/bitbucket-server-upgrade-guide-776640551.html