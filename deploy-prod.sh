#!/bin/bash -x
sed -i 's/https:\/\/test-wine79.com/https:\/\/wine79.com/g' config.toml
rm wine79.tar.gz
rm -rf public
zola build
tar -z -cf wine79.tar.gz public/*
scp -i ~/.ssh/aws-wordpress.pem wine79.tar.gz bitnami@35.83.167.212:~/
ssh -i ~/.ssh/aws-wordpress.pem bitnami@35.83.167.212 "cd htdocs; rm -rf wine79.last; mv -f wine79 wine79.last; tar -zxf ~/wine79.tar.gz; mv -f public wine79"
