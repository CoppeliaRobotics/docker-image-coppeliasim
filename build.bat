@echo off
set COPPELIASIM_RELEASE=V4_9_0_rev2
set COPPELIASIM_FILE=CoppeliaSim_Edu_%COPPELIASIM_RELEASE%_Ubuntu24_04.tar.xz
if not exist download/%COPPELIASIM_FILE% (
    echo Download https://downloads.coppeliarobotics.com/%COPPELIASIM_RELEASE%/%COPPELIASIM_FILE% and place into the download directory located in this repository.
    exit /b
)
echo on
docker build --rm -f Dockerfile -t coppeliasim-ubuntu24:latest .
