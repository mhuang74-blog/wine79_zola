#!/bin/bash -x
rm test-wine79.tar.gz
tar -z -cf test-wine79.tar.gz public/*
scp -i ~/.ssh/aws-wordpress.pem test-wine79.tar.gz bitnami@35.83.167.212:~/
ssh -i ~/.ssh/aws-wordpress.pem bitnami@35.83.167.212 "rm -rf htdocs/test-wine79.last; mv -f htdocs/test-wine79 htdocs/test-wine79.last; tar -zxf test-wine79.tar.gz; mv -f public htdocs/test-wine79"
