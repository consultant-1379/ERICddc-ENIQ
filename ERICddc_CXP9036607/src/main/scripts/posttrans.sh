#!/bin/bash
#posttrans scriptlet (using /bin/sh):

#
# If ddc is still installed at the end of the transaction
# start the service
#
if [ -x /etc/init.d/ddc ] ; then
    if [ "$(/sbin/pidof systemd)" ] ; then
        /bin/systemctl start ddc.service
    elif [ "$(/sbin/pidof init)" ] ; then
        /sbin/service ddc start
    else
        echo "Error: Failed to find any services system."
    fi
fi

exit 0


