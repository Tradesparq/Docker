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
if [ -z "$USER3_ADDRESS" ];
  then USER3_ADDRESS="http://$USER3_PORT_9000_TCP_ADDR:$USER3_PORT_9000_TCP_PORT"
fi
if [ -z "$API_DEV_ADDRESS" ];
  then API_DEV_ADDRESS="http://$API_DEV_PORT_3040_TCP_ADDR:$API_DEV_PORT_3040_TCP_PORT"
fi

/bin/sed -i "s@<API_ADDRESS>@${API_ADDRESS}@" /etc/nginx/sites-enabled/api
/bin/sed -i "s@<USER_ADDRESS>@${USER_ADDRESS}@" /etc/nginx/sites-enabled/user
/bin/sed -i "s@<PUBLIC_ADDRESS>@${PUBLIC_ADDRESS}@" /etc/nginx/sites-enabled/public
/bin/sed -i "s@<USER3_ADDRESS>@${USER3_ADDRESS}@" /etc/nginx/sites-enabled/user3
/bin/sed -i "s@<API_DEV_ADDRESS>@${API_DEV_ADDRESS}@" /etc/nginx/sites-enabled/api_dev

exec "$@"
