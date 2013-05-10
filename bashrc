# For non-login shells, these
# save the present working directory
# on logout
alias exit='if [ $(pwd) != ~ ] ; then pwd > ~/.logout_pwd; fi; exit'
alias logout='if [ $(pwd) != ~ ] ; then pwd > ~/.logout_pwd; fi; logout'

# For non-login shells, this restores
# the present working directory from
# the previous session
export OLDPWD=$(cat ~/.logout_pwd)
