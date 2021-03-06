#!/bin/bash

# set first tab to start 'roscore'
tabs=(--tab -e "bash -c 'roscore'")

# extra nodes/launchers to start after 'roscore'
# 1. websocket server
# 2. make tf2 available for web
# 3. kinect -> pointcloud2 @ topic=/camera/depth_registered/points
# 4. ros video server
declare -a nodes=(\
"roslaunch rosbridge_server rosbridge_websocket.launch" \
"rosrun tf2_web_republisher tf2_web_republisher" \
"roslaunch freenect_launch freenect-registered-xyzrgb.launch" \
"rosrun web_video_server web_video_server" \
"rosrun nodelet nodelet standalone depth_image_proc/convert_metric image_raw:=/camera/depth_registered/image_raw image:=/camera/depth_registered/image_float" \
"rosrun depthcloud_encoder depthcloud_encoder_node _depth:=/camera/depth_registered/image_float _rgb:=/camera/rgb/image_rect_color"
)

# sleep variable
sleep_time="2"

# create a new tab for each node with a
# sleep delay to allow 'roscore' to start first
for n in "${nodes[@]}"
do
  node_cmd="bash -c 'sleep $sleep_time; $n'"
  tabs+=(--tab -e "$node_cmd")
done

# open all the tabs in a new terminal
gnome-terminal "${tabs[@]}"



