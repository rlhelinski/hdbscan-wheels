# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    :
}

function run_tests {
    if [ -n "$IS_OSX" ]; then
        echo "Mac OS X should already be using a UTF-8 encoding..."
    else
        echo "Forcing en_US.UTF-8 as workaround for encoding issues in Biopython 1.70 tests"
        # There is likely a more consise method to do this, but this works:
        sudo echo "LANG=en_US.UTF-8" > /etc/default/locale
        sudo locale-gen en_US.UTF-8
        sudo dpkg-reconfigure locales
        export LANG="en_US.UTF-8"
    fi
    locale
    python -c "import sys; print(sys.version); print('Default encoding: ' + sys.getdefaultencoding())"
    python -c "import locale; print('Locale prefered encoding: ' + locale.getpreferredencoding())"
    # Runs tests on installed distribution from an empty directory
    python --version
    # Check the simplest import, and version for consistency
    # The package does not seem to define __version__
    #python -c "import hdbscan; print('HDBSCAN version: ' + hdbscan.__version__)"
    # So far so good, now let's run our full test suite...
    "nosetests -s hdbscan"
}
