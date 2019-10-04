#!/usr/bin/env expect
spawn iinit
expect "Enter the host name*:"
send "localhost\r"
expect "Enter the port*:"
send "1247\r"
expect "Enter your irods user*:"
send "rods\r"
expect "Enter your irods zone:"
send "tempZone\r"
expect "Enter your current iRODS*:"
send "admin\r"
expect eof