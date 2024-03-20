This is my fork for my environment... If you are looking for Matterport3d, go to [peteanderson80/Matterport3DSimulator](https://github.com/peteanderson80/Matterport3DSimulator)

- Bump Ubuntu 22.04
- Bump OpenCV 4.5
- Bump Catch 2.3
- Bump Torch 2.2
- Bump Cuda 12.1
- Bump nvidia 580


```
docker build -t padoukca/glo7030-ulaval-h2024:v3 .
```

```
docker run --gpus all -it --mount type=bind,source=/media/t2/matterport3d/data/v1/scans,target=/workspace/Matterport3DSimulator-fork/data/v1/scans padoukca/glo7030-ulaval-h2024:v3
```

