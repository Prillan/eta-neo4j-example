#!/bin/bash

# Set this to your java 8 path.
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

rm -rf ~/.m2/repository/eta
rm -rf .localmaven/eta

EXPORTED=../eta-neo4j-example/dist/build/eta-neo4j-example/eta-neo4j-example.jar
mvn install:install-file -Dfile=$EXPORTED \
                         -DgroupId=eta.example \
                         -DartifactId=eta-example \
                         -Dversion=1.0 \
                         -Dpackaging=jar \
                         -DlocalRepositoryPath=.localmaven \
                         -DgeneratePom=true

mvn clean package
