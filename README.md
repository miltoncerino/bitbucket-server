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

## BACKUP A RUNNING INSTANCE
1. create a backup of your currently running Bitbucket Server

To create a backup of your currently running Bitbucket server, follow the standard procedure described in Atlassians Bitbucket Server DIY Backup (https://confluence.atlassian.com/bitbucketserver/using-bitbucket-server-diy-backup-776640056.html). Basically, you have to download their scripts, adjust the settings to your environment and execute the script. As a result, you should get an archive containing your repositories together with a database dump (in our case Postgres).

2. create new Docker data volumes for your new Bitbucket Server and Postgres data
3. import the data to those containers
4. run the service with Docker compose

## SOURCES
https://medium.com/@niko.huber/dockerizing-bitbucket-server-d07404eefc51

back up bitbucket and postgres:
https://confluence.atlassian.com/bitbucketserver/using-bitbucket-server-diy-backup-776640056.html

migration:
https://confluence.atlassian.com/bitbucketserver/bitbucket-server-upgrade-guide-776640551.html