FROM osrf/ros:foxy-desktop
ENV NO_AT_BRIDGE=1

RUN apt-get update && apt-get install -y \
    glmark2 \
    curl \
    gnome-terminal \
    dbus-x11 \
    libcanberra-gtk3-module \
  && rm -rf /var/lib/apt/lists/* \
  && echo LANG=en_US.UTF-8 >/etc/default/locale

RUN apt-get update && apt-get install -y \
    ros-foxy-gazebo-ros-pkgs \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    libtins-dev \
  && rm -rf /var/lib/apt/lists/* \
  && export PYTHONPATH=/opt/ros/foxy/lib/python3.8/site-packages \
  && git clone https://github.com/ros-drivers/ros2_ouster_drivers.git \
  && cd ros2_ouster_drivers/ \
  && cd ouster_msgs/ \
  && mkdir build \
  && cd build/ \
  && cmake -DCMAKE_INSTALL_PREFIX=/opt/ros/foxy cmake -DCMAKE_PREFIX_PATH=/opt/ros/foxy .. \
  && make -j \
  && sudo make install \
  && cd ../.. \
  && cd ros2_ouster/ \
  && mkdir build \
  && cd build/ \
  && cmake -DCMAKE_INSTALL_PREFIX=/opt/ros/foxy .. \
  && make -j \
  && sudo make install \
  && cd ../..
