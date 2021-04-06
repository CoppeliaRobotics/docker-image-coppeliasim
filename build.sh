COPPELIASIM_RELEASE=CoppeliaSim_Edu_V4_2_0_Ubuntu18_04.tar.xz
if [ ! -f download/$COPPELIASIM_RELEASE ]; then
    if [ "$1" = "-d" ]; then
        if ! command -v curl > /dev/null 2>&1; then
            echo "Command 'curl' not available" 1>&2
            exit 1
        fi
        rm -rf download/tmp
        mkdir download/tmp
        echo "Downloading $COPPELIASIM_RELEASE"
        cd download/tmp
        curl --progress-bar --remote-name --location \
            https://www.coppeliarobotics.com/files/$COPPELIASIM_RELEASE || exit 1
        mv $COPPELIASIM_RELEASE ..
        cd -
    else
        echo "File 'download/$COPPELIASIM_RELEASE' not found."
        echo "Either download it manually, or pass the -d option."
        exit 1
    fi
fi
docker build --rm -f Dockerfile -t coppeliasim-ubuntu18:latest .
