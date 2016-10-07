#!/bin/bash

PY_INC=`$PYTHON -c "from distutils import sysconfig; print (sysconfig.get_python_inc(0, '$PREFIX'))"`

cmake \
    -D CMAKE_SYSTEM_PREFIX_PATH=$PREFIX \
    -D CMAKE_INSTALL_PREFIX=$PREFIX \
    -D Python_ADDITIONAL_VERSIONS=${PY_VER} \
    -D PYTHON_EXECUTABLE=$PYTHON \
    -D PYTHON_INCLUDE_DIR=${PY_INC} \
    -D BOOST_ROOT=$PREFIX -D Boost_NO_SYSTEM_PATHS=ON \
    -D CMAKE_BUILD_TYPE=Release \
    .

make -j$CPU_COUNT

#if [[ `uname` == 'Linux' ]]; then
#    RDBASE=$SRC_DIR LD_LIBRARY_PATH="$PREFIX/lib:$SRC_DIR/lib" PYTHONPATH=$SRC_DIR ctest -j$CPU_COUNT
#    RDBASE=$SRC_DIR LD_LIBRARY_PATH="$PREFIX/lib:$SRC_DIR/lib" PYTHONPATH=$SRC_DIR $PYTHON "$RECIPE_DIR/pkg_version.py"
#else
#    RDBASE=$SRC_DIR DYLD_FALLBACK_LIBRARY_PATH="$PREFIX/lib:$SRC_DIR/lib" PYTHONPATH=$SRC_DIR ctest -j$CPU_COUNT
#    RDBASE=$SRC_DIR DYLD_FALLBACK_LIBRARY_PATH="$PREFIX/lib:$SRC_DIR/lib" PYTHONPATH=$SRC_DIR $PYTHON "$RECIPE_DIR/pkg_version.py"
#fi

make install
