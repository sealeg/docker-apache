#!/bin/bash
set -e

if [ -z "$1" ]; then
    config_dir=/config
    data_dir=/data
    log_dir=/logs
    if [ ! -d "$config_dir" ]; then
        mkdir "$config_dir"
    fi
    if [ ! -d "$data_dir" ]; then
        mkdir "$data_dir"
    fi
    if [ ! -d "$log_dir" ]; then
        mkdir "$log_dir"
        rm -f /etc/httpd/logs
        ln -s "$log_dir" /etc/httpd/logs
    fi
    chmod 700 "$log_dir"
    chown -R apache.apache "$data_dir"
    exec httpd -DFOREGROUND
else
    exec "$@"
fi
