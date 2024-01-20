#!/bin/sh

# Not sure where JDK is installed? Call:
# update-alternatives --list java
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64; export JAVA_HOME
echo "Set Java:"
echo $JAVA_HOME
ant fluenta
