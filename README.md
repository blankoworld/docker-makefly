# How to use it

Just do this in this directory:

    docker build -t makefly:latest .
    docker run -p 8080:80 -t -i --name makefly makefly:latest /bin/bash

And you will enter in the docker image. Makefly is located in /opt/makefly-master.

# In the docker container

Do this:

    cd /opt/makefly-master
    ./makefly

You will see the list of available commands.

# See result

To see the result of what Makefly do, you can consult your local webbrowser to the given address: [http://localhost:8080/](http://localhost:8080/ "See Makefly container result").
