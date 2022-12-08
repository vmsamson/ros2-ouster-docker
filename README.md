# ros2-ouster-docker

## Requirements

* docker
* nvidia-container-toolkit
* user in `docker` group

## Quick start

To run ros2-ouster environment:

```console
git clone https://github.com/vmsamson/ros2-ouster-docker
cd ros2-ouster-docker
./run
```

When inside ros2-ouster environment, start the Lidar stream:

```console
ros2 launch ros2_ouster driver_launch.py
```

From another terminal, run rviz2:

```console
rviz2
```

Change Global Options / Fixed Frame from `map` to `laser_sensor_frame`

Add (Create Visualization) / By Topic / `/points` `PointCloud2`
