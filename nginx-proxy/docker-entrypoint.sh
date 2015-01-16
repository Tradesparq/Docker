#!/bin/bash

if [ -z "$API_ADDRESS" ];
  then API_ADDRESS="http://$API_PORT_3030_TCP_ADDR:$API_PORT_3030_TCP_PORT"
fi
if [ -z "$USER_ADDRESS" ];
  then USER_ADDRESS="http://$USER_PORT_80_TCP_ADDR:$USER_PORT_80_TCP_PORT"
fi
if [ -z "$PUBLIC_ADDRESS" ];
  then PUBLIC_ADDRESS="http://$PUBLIC_PORT_3000_TCP_ADDR:$PUBLIC_PORT_3000_TCP_PORT"
fi

/bin/sed -i "s@<API_ADDRESS>@${API_ADDRESS}@" /etc/nginx/sites-enabled/api
/bin/sed -i "s@<USER_ADDRESS>@${USER_ADDRESS}@" /etc/nginx/sites-enabled/user
/bin/sed -i "s@<PUBLIC_ADDRESS>@${PUBLIC_ADDRESS}@" /etc/nginx/sites-enabled/public

exec "$@"
