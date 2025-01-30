FROM ubuntu:24.04

RUN apt-get update -q && \
	export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --no-install-recommends \
        vim tar xz-utils \
        libx11-6 libxcb1 libxau6 libgl1-mesa-dev \
        xvfb dbus-x11 x11-utils libxkbcommon-x11-0 \
        libavcodec-dev libavformat-dev libswscale-dev \
        python3 python3-pip python3-venv libraw1394-11 libmpfr6 \
        libusb-1.0-0 \
        && \
    apt-get autoclean -y && apt-get autoremove -y && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /shared /opt

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip3 install pyzmq cbor2

COPY ./download/CoppeliaSim_Edu_V4_9_0_rev2_Ubuntu24_04.tar.xz /opt/
RUN tar -xf /opt/CoppeliaSim_Edu_V4_9_0_rev2_Ubuntu24_04.tar.xz -C /opt && \
    rm /opt/CoppeliaSim_Edu_V4_9_0_rev2_Ubuntu24_04.tar.xz

ENV COPPELIASIM_ROOT_DIR=/opt/CoppeliaSim_Edu_V4_9_0_rev2_Ubuntu24_04
ENV LD_LIBRARY_PATH=$COPPELIASIM_ROOT_DIR:$LD_LIBRARY_PATH
ENV PATH=$COPPELIASIM_ROOT_DIR:$PATH

RUN echo '#!/bin/bash\ncd $COPPELIASIM_ROOT_DIR\n/usr/bin/xvfb-run --server-args "-ac -screen 0, 1024x1024x24" coppeliaSim "$@"' > /entrypoint && chmod a+x /entrypoint
# Run CoppeliaSim with the -h option (you can also specify a license key with -Glicense=licenseKey or use of Python with -GpreferredSandboxLang=python):
CMD ["./coppeliaSim.sh", "-h"]

# Use following instead to open an application window via an X server:
# RUN echo '#!/bin/bash\ncd $COPPELIASIM_ROOT_DIR\n./coppeliaSim "$@"' > /entrypoint && chmod a+x /entrypoint

EXPOSE 23000-23500
ENTRYPOINT ["/entrypoint"]
