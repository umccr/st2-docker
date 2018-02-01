#!/bin/bash
rm -f /etc/nginx/conf.d/st2.conf
cp /st2-docker/st2.d/st2-nginx-umccr.cnf /etc/nginx/conf.d/
ln -s /etc/nginx/conf.d/st2-nginx-umccr.cnf /etc/nginx/conf.d/st2.conf

service nginx restart
