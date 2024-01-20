#!/bin/sh

# Not sure where JDK is installed? Call:
# update-alternatives --list java

# Compile Fluenta
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64; export JAVA_HOME
echo "Set Java:"
echo $JAVA_HOME
ant fluenta

# Echo Fluenta version
Fluenta/fluenta_cli.sh -version

# Create a project
