# DODSLeague Dodhooks Build

This image is intended to build [dodhooks](https://github.com/DODSLeague/dodhooks) .

## Linux Container

[![linux/amd64](https://github.com/DODSLeague/build-dodhooks/actions/workflows/build-linux-image.yml/badge.svg?branch=main)](https://github.com/DODSLeague/build-dodhooks/actions/workflows/build-linux-image.yml)

### Download

```shell
docker pull dodsleague/build-dodhooks:latest;
```

### Run dodhooks build
run in dodhooks source Folder
```shell
docker run -it --rm -v $PWD:/WORKDIR/dodhooks dodsleague/build-dodhooks:latest
```

