# For login shells, this saves
# the present working directory
# on logoout
if [ $(pwd) != ~ ] ; then pwd > ~/.logout_pwd; fi;
