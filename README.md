# Super-basic Git over HTTP

This Dockerfile setup builds a Fedora 21 server with HTTP, and sets up `/var/www/git` as the base dir to serve using the [git-http-backend](http://git-scm.com/docs/git-http-backend).

## How to build this

    $ git clone https://github.com/nhr/githttp
    $ cd githttp
    $ docker build . -t githttp

## How to run this
This docker image expects you to bind mount a volume on the host to `/var/www/git` on the running container. For instance, if the git repos that you want to serve live at `/home/fedora/repos`, you would run this docker image with the following command:

    $ docker run -d -p 8888:80 --name=githttp -v /home/fedora/repos:/var/www/git githttp

- - -

**NOTE**: In order for this to work, you need to set a configuration value in the git repo(s) that you want to serve:

    $ cd /path/to/repo/dir
    $ git config http.receivepack true

- - -

## How to access repos hosted by this docker container
If you followed the example above, then this container is available at port 8888 on your docker host. So assuming you have a repo called "foo" in the directory that ypu bind mounted to `var/www/git`, you should be able to run:

    $ git clone http://<docker_host>:8888/foo

