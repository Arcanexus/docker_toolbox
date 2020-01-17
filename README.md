# docker_toolbox

## Embedded tools
- git
- tig
- vim
- tree
- wget
- curl
- cntlm
- unzip
- jq
- python2.7
- python3
- ansible
- docker
- docker-compose
- kubectl
- helm3

## how to use your own SSH keys
Put you _id_rsa_ and _id_rsa.pub_ keys in a specific folder and mount it in /tmp/.ssh :
```
docker run \
    -d \
    --name toolbox \
    -v /home/user/.ssh:/tmp/.ssh:ro
    arcanexus/toolbox:latest 
```
