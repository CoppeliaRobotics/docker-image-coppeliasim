CoppeliaSim Docker image
=======================================

### Building:

Use `docker build` as usual, or use the provided script:

```bash
sh build.sh
```

### Running:

Use `docker run` as usual.

The provided script `run.sh` sets some useful parameters, such as sharing the `shared` directory, and forwarding the RemoteAPI port. It will also forward any argument to the `coppeliaSim` executable, e.g.:

```bash
sh run.sh -s10000 -q /shared/mySimulation.ttt
```

### Credits:

Thanks to Salvatore Sessa for initially getting CoppeliaSim to work under docker.
