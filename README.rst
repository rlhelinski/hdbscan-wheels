This repository on GitHub is to automate the compilation of binary
wheel packages of HDBSCAN for later upload to PyPI.

- https://github.com/scikit-learn-contrib/hdbscan
- https://pypi.python.org/project/hdbscan/

It uses the ``multibuild`` system developed by Matthew Brett and
the MacPython project.

- https://github.com/matthew-brett/multibuild
- https://github.com/MacPython/wiki/wiki/Wheel-building

The builds themselves are performed on virtual machines using
continuous integration testing services. Specifically, TravisCI
for Linux and Apple Mac OS X, and AppVeyor for Microsoft Windows.

- https://travis-ci.org/rlhelinski/hdbscan-wheels/builds
- https://ci.appveyor.com/project/rlhelinski/hdbscan-wheels/history

These files were based on https://github.com/biopython/biopython-wheels
