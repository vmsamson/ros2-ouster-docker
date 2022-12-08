FROM osrf/ros:humble-desktop
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
    ros-humble-gazebo-ros-pkgs \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    libtins-dev \
  && rm -rf /var/lib/apt/lists/* \
  && export PYTHONPATH=/opt/ros/humble/lib/python3.10/site-packages:/opt/ros/humble/local/lib/python3.10/dist-packages \
  && git clone https://github.com/ros-drivers/ros2_ouster_drivers.git \
  && cd ros2_ouster_drivers/ \
  && cd ouster_msgs/ \
  && mkdir build \
  && cd build/ \
  && cmake -DCMAKE_INSTALL_PREFIX=/opt/ros/humble cmake .. \
  && make -j \
  && sudo make install \
  && cd ../.. \
  && cd ros2_ouster/ \
  && mkdir build \
  && cd build/ \
  && cmake -DCMAKE_INSTALL_PREFIX=/opt/ros/humble .. \
  && make -j \
  && sudo make install \
  && cd ../..
