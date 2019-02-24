## Build
```
docker build --build-arg arch=$(dpkg --print-architecture) -t jiesu/git-cleaner:$(dpkg --print-architecture) .
```

## Run
```
docker run --rm -v <path to git repo>:/repo jiesu/docker-git-cleaner:<amd64|armhf> [options...]
```

