# ros2-ouster-docker

## Requirements

- Use a Linux computer
- Have docker installed, if not: https://docs.docker.com/engine/install/ubuntu/
- Have Nvidia container kit installed, if not: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html
- User in `docker` group


## Steps to run ROS2
To run ros2-ouster environment:
```bash
docker pull ghcr.io/vmsamson/ros2-ouster
cd
mkdir Workspace
cd Workspace
git clone https://github.com/vmsamson/ros2-ouster-docker.git
cd ros2-ouster-docker
./run
```
What just happened:
- Created a Docker (taken an image of the drivers & set ups required and temporarily set up your computer)
- when typed `exit` all changes that you have made will disappear, which means every step that is made from running will have to be reproduced after exiting and re running

When inside ros2-ouster environment, start the Lidar stream:

Note:
- Your IP and LiDAR IP are set to Padions, if you are not on or remotely connected to the computer, you will have to edit:
    - `nano /opt/ros/foxy/share/ros2_ouster/params/driver_config.yaml`
    - Edit Computer & LiDAR IP addresses
    - `ctrl` `X`
    - `y`
    - `Enter`
```bash
gnome-terminal
```
This will open up a second terminal in the exact same environment as the first, so you can run 2 scripts simultaneously

From Terminal 1, run:
```bash
ros2 launch ros2_ouster driver_launch.py
```

From another terminal, run rviz2:

```bash
rviz2
```
Inside RVIZ2:
Change Global Options / Fixed Frame from `map` to `laser_sensor_frame`

Located at the bottom of the screen: Add (Create Visualization) / By Topic / `/points` `PointCloud2`

ONCE DONE:
```bash
exit
```
