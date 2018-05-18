#!/bin/bash

set -e
# Tomcat version
TOMCAT_VER=8
TOMCAT_VERSION=8.5.31
# Tar file name
TOMCAT_CORE_TAR_FILENAME="apache-tomcat-$TOMCAT_VERSION.tar.gz"
# Download URL for Tomcat core
TOMCAT_CORE_DOWNLOAD_URL="http://www-us.apache.org/dist/tomcat/tomcat-$TOMCAT_VER/v$TOMCAT_VERSION/bin/$TOMCAT_CORE_TAR_FILENAME"
# The top-level directory after unpacking the tar file
TOMCAT_CORE_UNPACKED_DIRNAME="apache-tomcat-$TOMCAT_VERSION"

echo $TOMCAT_VER
echo $TOMCAT_VERSION
echo $TOMCAT_CORE_TAR_FILENAME
echo $TOMCAT_CORE_DOWNLOAD_URL
echo $TOMCAT_CORE_UNPACKED_DIRNAME
