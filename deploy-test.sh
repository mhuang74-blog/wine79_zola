#!/bin/bash -x
sed -i 's/https:\/\/wine79.com/https:\/\/test-wine79.com/g' config.toml
rm test-wine79.tar.gz
rm -rf public
zola build
tar -z -cf test-wine79.tar.gz public/*
scp -i ~/.ssh/aws-wordpress.pem test-wine79.tar.gz bitnami@35.83.167.212:~/
ssh -i ~/.ssh/aws-wordpress.pem bitnami@35.83.167.212 "cd htdocs; rm -rf test-wine79.last; mv -f test-wine79 test-wine79.last; tar -zxf ~/test-wine79.tar.gz; mv -f public test-wine79"
