This is my fork for my environment...

```
docker build -t padoukca/glo7030-ulaval-h2024:v3 .
```

```
docker run --gpus all -it --mount type=bind,source=/volume1/Datasets/matterport3d/data/v1/scans,target=/workspace/Matterport3DSimulator-fork/data/v1/scans --volume `pwd`:/workspace/Matterport3DSimulator-fork padoukca/glo7030-ulaval-h2024:v3
```

Now (from inside the docker container), build the simulator code:
```
cd /workspace/Matterport3DSimulator-fork
mkdir build && cd build
cmake -DEGL_RENDERING=ON ..
make
cd ../
```
