#!/bin/bash
rm -f /etc/nginx/conf.d/st2.conf
cp /st2-docker/entrypoint.d/st2-umccr.cnf /etc/nginx/conf.d/
ln -s /etc/nginx/conf.d/st2-umccr.cnf /etc/nginx/conf.d/st2.conf
