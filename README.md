# Docker FNM

Fast Node Manager dockerised for CI or other edge usages.

[![Available in Docker Hub](https://img.shields.io/badge/Docker%20Hub-latest-blue?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABX0lEQVQ4jc2QMUtbcRTFf+efNInYVGgSZ+FlUaHfoVvBb+DsoFgQodCp4OTS0qHQt4hLF8HVqZ2KIJIP4NCSpKIOUt97Hdo88mzf/3axYqiEt+nZzuX+zj1cuNdqh9FeEMZb43bKI27XSjetRckcWL1wQBDFHVADyEAZUANVR3bef2/3Llp9NuSvA+Z3rZKdI08SyzCkDLiUZOYtmdn4Vpsk9bRalaFKX4LpZLMHrwAEEITRZ3Bz4E9GG1gTOAFmDTrOsW6eI+AncIC5nfKTDzaZDn4cevOnDkXeqEv2G7M/OD3EEyOOBd1hmp5XqhMDSXXgGbKhgjDOATfuUbfoo4y33dXGpzKQAM3CqHSZPSgtni1NJVxd3i8OY+b9+j8YwMnxBvAFcAO97q82w5tD111uHGK2BuRj4F+QL/RWHr/8v9SV2u/iR1biBdJTzFeRSxEdy/Pt/vPW1wIN70h/AX8nijGM4hQRAAAAAElFTkSuQmCC)](https://hub.docker.com/r/d8vjork/fnm) [![ci](https://github.com/d8vjork/docker-fnm/actions/workflows/publish.yml/badge.svg)](https://github.com/d8vjork/docker-fnm/actions/workflows/publish.yml)

## Getting starter

Imagine that you simply have a `.node-version` file with `14` on its content, so your project will be constrained by this NodeJS version, and therefore this Docker container will automatically use this version (but it's not limited to, as it wraps FNM: [read more here](https://github.com/Schniz/fnm)).

### Standalone

```sh
docker run --rm -v $PWD/myapp:/work d8vjork/fnm fnm --help
```

### Gitlab CI

```yaml
build_publish:
  image: d8vjork/fnm
  script:
    - yarn install
    - yarn build
    - npm version --allow-same-version ${CI_COMMIT_TAG}
    - npm publish
    # More here... maybe?
```