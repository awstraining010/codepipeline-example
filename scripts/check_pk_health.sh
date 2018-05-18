#!/bin/bash

set -e

CATALINA_HOME=/usr/share/tomcat-codedeploy

# Tomcat version
TOMCAT_VER=8
TOMCAT_VERSION=8.5.31
# Tar file name
TOMCAT_CORE_TAR_FILENAME="apache-tomcat-$TOMCAT_VERSION.tar.gz"
# Download URL for Tomcat core
TOMCAT_CORE_DOWNLOAD_URL="http://www-us.apache.org/dist/tomcat/tomcat-$TOMCAT_VER/v$TOMCAT_VERSION/bin/$TOMCAT_CORE_TAR_FILENAME"
# The top-level directory after unpacking the tar file
TOMCAT_CORE_UNPACKED_DIRNAME="apache-tomcat-$TOMCAT_VERSION"



# Check whether there exists a valid instance
# of Tomcat installed at the specified directory
[[ -d $CATALINA_HOME ]] && { service tomcat status; } && {
    echo "Tomcat is already installed at $CATALINA_HOME. Skip reinstalling it."
    exit 0
}

# Clear install directory
if [ -d $CATALINA_HOME ]; then
    rm -rf $CATALINA_HOME
fi
mkdir -p $CATALINA_HOME

# Download the latest Tomcat version
cd /tmp
{ which wget; } || { yum install wget; }
wget $TOMCAT_CORE_DOWNLOAD_URL
if [[ -d /tmp/$TOMCAT_CORE_UNPACKED_DIRNAME ]]; then
    rm -rf /tmp/$TOMCAT_CORE_UNPACKED_DIRNAME
fi
tar xzf $TOMCAT_CORE_TAR_FILENAME

# Copy over to the CATALINA_HOME
cp -r /tmp/$TOMCAT_CORE_UNPACKED_DIRNAME/* $CATALINA_HOME

# Create the service init.d script
cat > /etc/init.d/tomcat <<'EOF'
#!/bin/bash
# description: Tomcat Start Stop Restart
# processname: tomcat
PATH=$JAVA_HOME/bin:$PATH
export PATH
CATALINA_HOME='/usr/share/tomcat-codedeploy'

case $1 in
start)
sh $CATALINA_HOME/bin/startup.sh
;;
stop)
sh $CATALINA_HOME/bin/shutdown.sh
;;
restart)
sh $CATALINA_HOME/bin/shutdown.sh
sh $CATALINA_HOME/bin/startup.sh
;;
esac
exit 0
EOF

# Change permission mode for the service script
chmod 755 /etc/init.d/tomcat
