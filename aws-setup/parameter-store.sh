#!/bin/bash
aws ssm get-parameters --region ap-northeast-1 --names hans-dbpassword --with-decryption --query Parameters[0].Value
