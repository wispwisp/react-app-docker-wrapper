#!/bin/bash

docker run -it --name learnjs -p127.0.0.1:3000:3000 --restart always learnjs:latest /bin/bash
# -v $(pwd -P)/src:/src:ro

