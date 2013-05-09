oldoldpwd
=========

In the bash shell, typing the command `cd -` will bring you to the previous directory that you had been cd'd into. This is thanks to the OLDPWD environment variable, which stores your old PWD, or present working directory.

This project saves your present working directory when you leave a shell - either log out of a login shell or exit a non-login shell - and restores it so that you can run `cd -` the next time you open a shell or log in.

###Installation

curl -s --insecure https://raw.github.com/joshlf13/oldoldpwd/master/install.sh > /tmp/oldoldpwd.sh && bash /tmp/oldoldpwd.sh
