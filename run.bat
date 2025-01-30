docker run -v %CD%\shared:/shared -p 23000-23500:23000-23500 -it coppeliasim-ubuntu24 %*

REM To open an application window via X server:
REM docker run -v %CD%\shared:/shared -p 23000-23500:23000-23500 -it --env DISPLAY=host.docker.internal:0.0 coppeliasim-ubuntu24 %*

REM on the host, download and install e.g. VcXsrv, select "Multiple windows", select "Start no client" and check "Disable access control":
REM then, with cmd:
REM set DISPLAY=host.docker.internal:0.0
REM or with powerShell:
REM $Env:DISPLAY="host.docker.internal:0.0"
