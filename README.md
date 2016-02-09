# pointcloud-web-test
Test rendering pointclouds in the browser using ROS packages and javascript

## kinect -> web browser

1. ensure ROS installed, kinect and web packages installed
  + installation scripts availabe at [https://github.com/rozifus/ros-scripts](https://github.com/rozifus/ros-scripts)
1. start ROS server and nodes
  + `./run_kinect.sh`
1. open in browser `/PointCloudExample/pointcloud2_bson_example.html`
+ You may need to change the topic in `pointcloud2_bson_example.html`

## building/using custom catkin downsampler package
 
1. create a catkin workspace
1. symlink `catkin_src/pointcloud2_downsampler` to your workspace
  + `ln -s ./catkin_src/pointcloud2_downsampler ~/path_to_your_catkin_workspace`
1. make package
  + `cd ~/path_to_your_catkin_workspace`
  + `catkin_make`
1. source workspace
  + `source ~/your_catkin_workspace/devel/setup.bash`
1. run node
  + `rosrun pointcloud2_downsampler converter input:=/path_to_input_topic`
  + output will be available at topic `/output`
