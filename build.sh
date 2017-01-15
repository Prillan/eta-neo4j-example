#!/bin/bash

cd eta-neo4j-example && ./build.sh && \
    cd ../wrapper && ./build.sh && \
    cd .. && cp wrapper/target/procedure-template-1.0.0-SNAPSHOT.jar output.jar
