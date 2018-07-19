#!/bin/bash
set -e -x

# Compile wheels
for PYBIN in /opt/python/*/bin; do
# NumPy does not support Python < 3.4
    if [[ "$PYBIN" = *"cp33-cp33m"* ]] ; then continue; fi
    "${PYBIN}/pip" install numpy nose scipy cython
    "${PYBIN}/pip" wheel /io/ -w wheelhouse/
done

# Bundle external shared libraries into the wheels
for whl in wheelhouse/*.whl; do
    auditwheel repair "$whl" -w /io/wheelhouse/
done

# Install packages and test
for PYBIN in /opt/python/*/bin/; do
    if [[ "$PYBIN" = *"cp33-cp33m"* ]] ; then continue; fi
    "${PYBIN}/pip" install hdbscan --no-index -f /io/wheelhouse
    (cd "$HOME"; "${PYBIN}/nosetests" -s hdbscan)
done
