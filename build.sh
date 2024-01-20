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

# Determine absulute path of DITAMAP
DITAMAP=$(readlink -f dita/map.ditamap)
echo "${DITAMAP}"

# Create a project
Fluenta/fluenta_cli.sh -add ../project.json

# Echo all projects
Fluenta/fluenta_cli.sh -getProjects

# Generate XLIFF
Fluenta/fluenta_cli.sh -generateXLIFF ../genXLIFF.json -verbose
