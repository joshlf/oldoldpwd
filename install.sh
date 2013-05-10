#!/bin/bash

# Copyright 2013 The Authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

BASH_LOGOUT="$HOME/.bash_logout"
BASH_PROFILE="$HOME/.bash_profile"
BASHRC="$HOME/.bashrc"

BASH_LOGOUT_SCRIPT='if [ $(pwd) != ~ ] ; then pwd > ~/.logout_pwd; fi;'
ALIAS_EXIT='alias exit='"'"'if [ $(pwd) != ~ ] ; then pwd > ~/.logout_pwd; fi; exit'"'"
ALIAS_LOGOUT='alias logout='"'"'if [ $(pwd) != ~ ] ; then pwd > ~/.logout_pwd; fi; logout'"'"

SET_OLDPWD='export OLDPWD=$(cat ~/.logout_pwd)'

LOGIN_PROMPT='Would you like this to run for your login shell [y/n]? '

LOGIN_SHELL=""
while [ "$LOGIN_SHELL" != "y" -a "$LOGIN_SHELL" != "n" -a "$LOGIN_SHELL" != "Y" -a "$LOGIN_SHELL" != "N" ] ; do
	echo -n $LOGIN_PROMPT
	read LOGIN_SHELL
	if [ "$LOGIN_SHELL" != "y" -a "$LOGIN_SHELL" != "n" -a "$LOGIN_SHELL" != "Y" -a "$LOGIN_SHELL" != "N" ] ; then
		echo "I'm sorry, I didn't understand that."
	fi
done

NON_LOGIN_PROMPT="Would you like this to run for your non-login shell [y/n]? "

NON_LOGIN_SHELL=""
while [ "$NON_LOGIN_SHELL" != "y" -a "$NON_LOGIN_SHELL" != "n" -a "$NON_LOGIN_SHELL" != "Y" -a "$NON_LOGIN_SHELL" != "N" ] ; do
        echo -n $NON_LOGIN_PROMPT
        read NON_LOGIN_SHELL
        if [ "$NON_LOGIN_SHELL" != "y" -a "$NON_LOGIN_SHELL" != "n" -a "$NON_LOGIN_SHELL" != "Y" -a "$NON_LOGIN_SHELL" != "N" ] ; then
                echo "I'm sorry, I didn't understand that."
        fi
done

# convert inputs to bash-testable booleans
if [ "$LOGIN_SHELL" == "Y" -o "$LOGIN_SHELL" == "y" ] ; then LOGIN_SHELL=y ; else LOGIN_SHELL= ; fi
if [ "$NON_LOGIN_SHELL" == "Y" -o "$NON_LOGIN_SHELL" == "y" ] ; then NON_LOGIN_SHELL=y ; else NON_LOGIN_SHELL= ; fi

if [ $LOGIN_SHELL ] ; then
	echo $BASH_LOGOUT_SCRIPT >> $BASH_LOGOUT
	echo $SET_OLDPWD >> $BASH_PROFILE
	touch $HOME/.logout_pwd
fi

if [ $NON_LOGIN_SHELL ] ; then
	echo $ALIAS_EXIT >> $BASHRC
	echo $ALIAS_LOGOUT >> $BASHRC
	echo $SET_OLDPWD >> $BASHRC
	touch $HOME/.logout_pwd
fi