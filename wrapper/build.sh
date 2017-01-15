#!/bin/bash

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

EXPORTED=../proc-test/dist/build/HSproc-test-0.1.0.0.jar
rm -rf ~/.m2/repository/eta
rm -rf ~/.localmaven/eta
mvn install:install-file -Dfile=$EXPORTED \
                         -DgroupId=eta.example \
                         -DartifactId=eta-example \
                         -Dversion=1.0 \
                         -Dpackaging=jar \
                         -DlocalRepositoryPath=$HOME/.localmaven \
                         -DgeneratePom=true

mvn clean package
