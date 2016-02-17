#!/bin/sh

CHECK_LEVEL=""

# When no path is specified, it defaults to the current directory
CHECK_PATH=.

if [ $# -eq 0 ]; then
    echo "Usage: $0 LEVEL [files or paths]"
    echo "LEVEL: all, warning, style, performance, portability, information, unusedFunction, missingInclude"
    exit 0
elif [ $# -gt 0 ]; then
    # check level must be specified
    CHECK_LEVEL=$1
    if [ $# -eq 2 ]; then
        # Assign files or paths when specified
        CHECK_PATH=$2
    fi
fi

# Even though this script has been made somewhat more flexible than before,
# it is currently assumed to run from the tmc directory.
# Thus, the -I (include files) paths are specified relative to the `tmc` directory.
# In the future, this will be relative to the root of C755A source code.

/usr/bin/env cppcheck --enable=${CHECK_LEVEL} --force \
    --library=tmc.cfg \
    -I ../hmi/Nel-gws/Project/NelVisu_new/NelVisu_new/src \
    -I ../mcs/bmf/col/orb/inc \
    -I ../mcs/bmf/inc \
    -I ../mcs/scc/ala/ext/inc \
    -I ../mcs/sig/ctl/orb/inc \
    -I ../mdb/INCLUDE_MDB/INCLUDE_MDB_SHARE \
    -I ../nel/inc \
    -I ../nel/red/inc \
    -I bmfint/inc \
    -I classes/inc \
    -I enc/inc \
    -I enc/tst \
    -I hor \
    -I include \
    -I integration \
    -I lch/inc \
    -I lch/tst \
    -I lchint/inc \
    -I mdbdef \
    -I pex/inc \
    -I pex/orb \
    -I pex/tst \
    -I pis/inc \
    -I reg/inc \
    -I reg/tst \
    -I sal/inc \
    -I sal/tst \
    -I scsint/inc \
    -I sigint/inc \
    -I sta/inc \
    -I stb/inc \
    -I stb/tst \
    -I stbint/inc \
    -I stub/include \
    -I stub/telcom \
    -I sup/inc \
    -I sup/orb \
    -I tcl/include \
    -I tgtint/inc \
    -I tools/inc \
    -I tra \
    -I trk/inc \
    -I trk/tst \
    -I twp/inc \
    ${CHECK_PATH}
