# C.J. May's resume

This repository contains the L<sup><big>A</big></sup>T<sub><big>E</big></sub>X source of my resume PDF, as well as all of the scripts necessary to rebuild it.

### Dependencies

The container image `ghcr.io/lawndoc/gitpdf` contains all the dependencies you need to build the PDF. See the [`.deps`](./.deps) and [`requirements.txt`](./requirements.txt) files to see the packages that are installed on top of the Ubuntu base image.

### Building the PDF yourself

```bash
docker run -it --rm -v release:/release ghcr.io/lawndoc/gitpdf:main bash
git clone https://github.com/lawndoc/resume && cd resume
make
cp -R release /release
```

You should now have my default resume (AppSec only) in the ./release folder that was mounted to the build container.
