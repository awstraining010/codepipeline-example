#!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo " Hello cloud from $(hostname -f). Created by USERDATA in Terraform."