#!/bin/bash

sudo chown -R user:user data
mkdir -p ~/data/forest_ws
cd ~/data/forest_ws
forest init
source setup.bash
forest add-recipes git@github.com:advrhumanoids/multidof_recipes.git -t ros2
forest grow all -j4 -m xeno -v
forest grow ec_xbot2_client -j8 -m xeno -v
