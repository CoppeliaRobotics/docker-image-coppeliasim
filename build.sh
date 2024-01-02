COPPELIASIM_RELEASE="V4_6_0_rev16"
COPPELIASIM_FILE="CoppeliaSim_Edu_${COPPELIASIM_RELEASE}_Ubuntu22_04.tar.xz"
if [ ! -f "download/${COPPELIASIM_FILE}" ]; then
    if [ "$1" = "-d" ]; then
        if ! command -v curl > /dev/null 2>&1; then
            echo "Command 'curl' not available" 1>&2
            exit 1
        fi
        rm -rf download/tmp
        mkdir download/tmp
        echo "Downloading ${COPPELIASIM_FILE}"
        cd download/tmp
        curl --progress-bar --remote-name --location \
            https://downloads.coppeliarobotics.com/${COPPELIASIM_RELEASE}/${COPPELIASIM_FILE} || exit 1
        mv ${COPPELIASIM_FILE} ..
        cd -
    else
        echo "File 'download/${COPPELIASIM_FILE}' not found."
        echo "Either download it manually, or pass the -d option."
        exit 1
    fi
fi
docker build --rm -f Dockerfile -t coppeliasim-ubuntu22:latest .
