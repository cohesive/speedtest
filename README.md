# VNS3 Speed Test container
This repo is a Docker container which runs a modified version of Librespeed Speedtest (https://github.com/librespeed/speedtest) for testing local throughput to a VNS3 controller.
Forked from that repo in order to maintain audit trail.

# Creating an image
1) Launch a VNS3 instance to use for building the container
2) Import a VNS3 base container (https://docs.cohesive.net/docs/network-edge-plugins/base-container/) (current version is based on 18.04) and name the image "vns3_base_1804".
3) Create a .zip file containing the `html` folder, `speedtest_nginx.conf`, `speedtest_supervisord.conf`, and `Dockerfile`.
4) Upload that .zip to VNS3 as a Dockerfile
5) Wait for build to complete; image will say "Ready" in the status column.

# Using the container
Please see the docs page for this container for instructions on launching and using this container.
https://docs.cohesive.net/docs/network-edge-plugins/speedtest/

# TODO

