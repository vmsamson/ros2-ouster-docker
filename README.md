# ros2-ouster-docker

## Requirements

- Use a Linux computer
- Have docker installed, if not: https://docs.docker.com/engine/install/ubuntu/
- Have Nvidia container kit installed, if not: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html
- User approved in `docker` group

## Testing step

Attempt to use ROS1, to test set up is correct:
```console
sudo usermod -aG docker $USER
sudo docker pull ghcr.io/vmsamson/warthog
cd
mkdir Workspace
cd Workplace
git clone https://github.com/vmsamson/warthog-docker.git
cd warthog-docker
sudo ./run
```
What just happened:
- Created a Docker (taken an image of the drivers & set ups required and temporarily set up your computer)
- when typed `exit` all changes that you have made will disappear, which is great for trial and error
```console
sudo apt update
glmark2
```
This is testing that GUI is loaded, not just the console. A horse should appear.
```console
sudo apt install -y                     \
    ros-$ROS_DISTRO-pcl-ros             \
    ros-$ROS_DISTRO-rviz                \
    ros-$ROS_DISTRO-tf2-geometry-msgs
```
25 for AUS English
```console
sudo apt install -y \
    build-essential \
    libeigen3-dev   \
    libjsoncpp-dev  \
    libspdlog-dev   \
    cmake
source /opt/ros/noetic/setup.bash 
source /devel/setup.bash
roslaunch ouster_ros sensor.launch      \
    sensor_hostname:= 192.168.40.9
```
Noting 192.168.40.9 is the IP of the LiDAR in the Sydney Office.

ONCE DONE:
```console
exit
```
## Real start

To run ros2-ouster environment:

```console
git clone https://github.com/vmsamson/ros2-ouster-docker
cd ros2-ouster-docker
./run
```
OR
```console
sudo ./run
```
When inside ros2-ouster environment, start the Lidar stream:
```console
sudo apt update
```
Note:
- Your IP and LiDAR IP are set to Padions, if you are not on or remotely connected to the computer, you will have to edit:
    - `nano /opt/ros/foxy/share/ros2_ouster/params/driver_config.yaml`
    - Edit Computer & LiDAR IP addresses
    - `ctrl` `X`
    - `y`
    - `Enter`
```console
gnome-terminal
```
This will open up a second terminal in the exact same environment as the first, so you can run 2 scripts simultaneously
From Terminal 1, run:
```console
ros2 launch ros2_ouster driver_launch.py
```

From another terminal, run rviz2:

```console
rviz2
```
Inside RVIZ2:
Change Global Options / Fixed Frame from `map` to `laser_sensor_frame`

Located at the bottom of the screen: Add (Create Visualization) / By Topic / `/points` `PointCloud2`

ONCE DONE:
```console
exit
```
