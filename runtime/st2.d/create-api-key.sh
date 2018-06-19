#!/bin/bash

token=$(st2 auth $ST2_USER -p $ST2_PASSWORD -t)

apikey=$(st2 apikey create -k -m '{"used_by": "cli"}' -t $token -k)

st2 key set api.key.webhook "$apikey"
