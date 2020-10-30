set -ex
docker run -v $PWD/shared:/shared -p 19997:19997 -it coppeliasim-ubuntu18 "$@"
