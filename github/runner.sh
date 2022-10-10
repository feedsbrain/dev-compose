#!/bin/bash
find /home/runner/github/environments -type f -name run.sh -exec bash -lc '{} &' \;
