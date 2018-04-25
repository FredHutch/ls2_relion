#!/bin/bash

set -e

# get tutorial data
curl -L ftp://ftp.mrc-lmb.cam.ac.uk/pub/scheres/relion21_tutorial.tar.gz > relion21_tutorial.tar.gz
tar -xzf relion21_tutorial.tar.gz
rm relion21_tutorial.tar.gz
