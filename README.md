# This Git Repository is a PDF

This repository contains the L<sup><big>A</big></sup>T<sub><big>E</big></sub>X source of my resume PDF, as well as all of the scripts necessary to rebuild the [polyglot](https://en.wikipedia.org/wiki/Polyglot_(computing)).

For details on how this works, read the [original article from PoC||GTFO](https://www.sultanik.com/pocorgtfo/pocorgtfo15.pdf#page=60).

### Building the Polyglot Yourself

If you cloned this repository directly from the PDF,

```
$ git clone CJ_May_Resume.pdf source/
Cloning into 'source'...
Receiving objects: 100% (174/174), 103.48 KiB | 0 bytes/s, done.
Resolving deltas: 100% (100/100), done.
```
then you will need to do some cleanup first:
```
cd source
git checkout master && git branch -d PolyglotBranch
```
After that, or if you cloned the repo from elsewhere (*e.g.*, [GitHub](https://github.com/lawndoc/resume)), then you can build the PDF from the git repo directory with the following command:

```
docker run -it -v .:/build ghcr.io/lawndoc/gitpdf:master echo -n "DevSecOps;CyberSec" | xargs -L1 -d ";" -I {} make -f Makefile_{}
```

This will automatically build my resumes and put them in the `release` folder.

### Dependencies

The container image `ghcr.io/lawndoc/gitpdf` contains all the dependencies you need to build the PDF. See the [`.deps`](./.deps) file to see the packages that are installed on top of the Ubuntu base image.

### Caveats

The polyglot will fail to build if your document has any PDF objects (*e.g.*, images) that are larger than `0xFFFF` bytes. Read [the original article](https://www.sultanik.com/pocorgtfo/pocorgtfo15.pdf#page=60) for more details.

### License (PDFGitPolyGlot)

Copyright © 2024 [C.J. May](https://cjmay.info)

Copyright © 2017 [Evan A. Sultanik](https://www.sultanik.com/)

Permission is hereby granted, free of charge, to any person obtaining a copy of this document and associated source files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice, this permission notice, and the entire contents and history of its associated git repository shall be included in all copies or substantial portions of the Software.

The Software is provided “as is”, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the Software or the use or other dealings in the software.
