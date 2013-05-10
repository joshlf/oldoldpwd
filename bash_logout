# Copyright 2013 The Authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

# For login shells, this saves
# the present working directory
# on logoout
if [ $(pwd) != ~ ] ; then pwd > ~/.logout_pwd; fi;
