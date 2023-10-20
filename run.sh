set -ex
docker run -v $PWD/shared:/shared -p 23000-23500:23000-23500 -it coppeliasim-ubuntu22 "$@"
