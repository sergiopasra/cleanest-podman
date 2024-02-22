# cleanest-podman
Cleanest inside a container

## Runing

podman run -ti --rm --env DISPLAY -v $XAUTHORITY:$XAUTHORITY:ro \
   -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
   --security-opt label=type:container_runtime_t \
   -v /home/mydata:/home/reducm/data:Z \
   --userns=keep-id:uid=2024,gid=2024 quay.io/sergiopasra/cleanest \
   /usr/bin/bash
