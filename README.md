# How to use it

Just do this in this directory:

    docker build -t makefly:latest .
    docker run -t -i --name makefly makefly:latest /bin/bash

And you will enter in the docker image. Makefly is located in /opt/makefly-master.

# In the docker container

Do this:

    cd /opt/makefly-master
    ./makefly

You will see the list of available commands.
