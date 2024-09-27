FROM hhcmhub/xbot2-noble-dev:latest 
ARG ROS2_IP

# make arg ROS2_IP mandatory
RUN test -n "$ROS2_IP" || (echo "ROS2_IP argument is mandatory!! You can set it as env variable before building" && false)

# install xenomai
ENV HHCM_FOREST_CLONE_DEFAULT_PROTO=https
RUN mkdir xeno_ws && cd xeno_ws && \
    forest init && \
    forest add-recipes git@github.com:advrhumanoids/multidof_recipes.git -t ros2 && \
    forest grow Xenomai -j8 -v && \
    cd .. && rm -rf xeno_ws

# xenomai from regular user
RUN sudo groupadd -f xenomai -g 1001
RUN sudo usermod -a -G xenomai user

# compile all code in mounted forest ws (data folder)
COPY docker/noble-ros2-xeno/bootstrap.sh /home/user/bootstrap.sh

# ros2 configuration for centauro, ecat_master alias, etc
COPY --chown=user . /home/user/ros2_config
WORKDIR /home/user/ros2_config
RUN mkdir build && \ 
    cd build && \ 
    cmake .. -DROS2_IP=${ROS2_IP} && \
    sudo cmake --install . --component sysctl_rules && \
    sudo sysctl --system && \
    cd .. && \
    echo "source $PWD/dds/cyclonedds/setup.bash" >> /home/user/.bashrc

WORKDIR /home/user