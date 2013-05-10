oldoldpwd
=========

In the bash shell, typing the command `cd -` will bring you to the previous directory that you had been cd'd into. This is thanks to the `OLDPWD` environment variable, which stores your old PWD, or present working directory.

This project saves your present working directory when you leave a shell - either log out of a login shell or exit a non-login shell - and restores it so that you can run `cd -` the next time you open a shell or log in.

###Installation

<pre>
curl -s --insecure https://raw.github.com/joshlf13/oldoldpwd/master/install.sh > /tmp/oldoldpwd.sh && bash /tmp/oldoldpwd.sh
</pre>

###Files

The code files (other than `install.sh`) contain code that should be inserted into the corresponding dot files in a user's home directory. For example, the contents of `bashrc` would go in `~/.bashrc`, and so forth.

###Future Plans

Eventually, I hope to port this to shells other than the bash shell.