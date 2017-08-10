#!/bin/bash


function ReplaceEnvironmentVariable() {
    grep -rl "\$ENV{\"$1\"}" $3|xargs -r \
        sed -i "s|\\\$ENV{\"$1\"}|$2|g"
}
cat /etc/nginx/conf.d/default.conf

if [ -n "$DEBUG" ]; then
    echo "Environment variables:"
    env
    echo "..."
fi

# Replace all variables
for _curVar in `env | awk -F = '{print $1}'`;do
    # awk has split them by the equals sign
    # Pass the name and value to our function
    ReplaceEnvironmentVariable ${_curVar} ${!_curVar} /etc/nginx/conf.d/default.conf
    ReplaceEnvironmentVariable ${_curVar} ${!_curVar} /etc/nginx/users.htpasswd
done

cat /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
