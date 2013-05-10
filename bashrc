# Copyright 2013 The Authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

# For non-login shells, these
# save the present working directory
# on logout
alias exit='if [ $(pwd) != ~ ] ; then pwd > ~/.logout_pwd; fi; exit'
alias logout='if [ $(pwd) != ~ ] ; then pwd > ~/.logout_pwd; fi; logout'

# For non-login shells, this restores
# the present working directory from
# the previous session
export OLDPWD=$(cat ~/.logout_pwd)
