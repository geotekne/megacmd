# megacmd

Docker image that allows to get public files from Mega.nz without need to install [megacmd tool](https://github.com/meganz/MEGAcmd).

## Why

- We are working on some GIS datasets and toolsets that we want to share with the community. 

- Some of those samples or toolsets implies big datasets files (4 GB or +). 
- We cannot afford the cost of transfer and/or storage, so we look for "free" options that would allow to storage and share files.
- As we are providing scripts that simplifies the installation process of those samples/tools, we need capability of getting those files from console (just to get them as if we are using a wget command)

Then, after checking for a couple of options, we decided to go with [Mega.nz](https://mega.nz/start) (up to 20 GB in free account, and megacmd tool that allows to manage the files using a console tool, in particular for downloading the files).  

As we don't expect people to install megacmd tool by themselves and as those toolsets/samples we are building work with docker images, it sounds reasonable to create this docker image for megacmd that will allow to download those dataset files without need of installing more tools (with just having docker installed, that should be enough). Note: [mega-get](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md) command does not require a login for public files.

In future, if we get some sponsor for data storage and transfer, probably this docker image will be unused for the samples we are building.

**Update 30 March 2022**: One alternative we evaluated is [Storj.io](https://www.storj.io/), but compared with megacmd, the related command-line tool ([uplink](https://us1.storj.io/onboarding-tour/cli/cli-setup)) requires to setup keys/login in order to download public files and that would make the process more complex. Besides that we can use the http public link using a curl command line so it's possible to download the files, so we have 2 ways for it and we moved scripts to use the Storj.io storage (150 GB storage and 150 GB bandwidth limit)



## Prerequisites

Docker installed. Check this: https://docs.docker.com/get-docker/



## How to build it

Linux users:

​       Run  

```
./build.sh
```



Windows users:  

​        Run 

```
docker build -t geotekne/megacmd:1.0.0 .
```

using console in the root of the repository.



## How to use it for a quick download

Reminder: Ensure you build the image !



As an example, if you run the following command  

```
docker run -it -v  `pwd`/tmp:/tmp  geotekne/megacmd:1.0.0 mega-get https://mega.nz/file/7Ww2lCxa#-jyAVIMi1gg0yNeEPzNhCCW_NVkSdNN_EjIAXYUqyuM /tmp
```

then :

1. You will download a file from https://mega.nz/file/7Ww2lCxa#-jyAVIMi1gg0yNeEPzNhCCW_NVkSdNN_EjIAXYUqyuM to /tmp folder inside the container.
2. Folder /tmp is mapped to \`pwd\`/tmp (that is "./tmp") at host, so the resulting downloaded file from point 1 will be also visible in the host at that location.
3. The docker run will run interactively so you will be able to see progress of downloads.
3. Files in "./tmp" folder (at host) will belong to root user, in order to change ownership use chown command.


So, in order to do a quick download, just change the URL mentioned in point 1, and that is all !

