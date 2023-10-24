set -ex
docker run -v $PWD/shared:/shared -p 23000-23500:23000-23500 -it coppeliasim-ubuntu22 "$@"

# To open an application window via X11 server:
# docker run -v $PWD/shared:/shared -p 23000-23500:23000-23500 -it --env DISPLAY=$DISPLAY --volume /tmp/.X11-unix:/tmp/.X11-unix --name coppelia_container coppeliasim-ubuntu22 "$@"

# on the host:
# xhost +local:docker
