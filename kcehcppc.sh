#!/bin/sh

# Print ever useful ha(e)lp message
print_halp()
{
    echo "Usage: `basename $0` -l LEVEL [-x] [files or paths]"
    echo "  -l, --level       Equivalent to --enable in cppcheck"
    echo "                    all, warning, style, performance, portability, information,"
    echo "                    unusedFunction, missingInclude"
    echo "  -x, --xml         When specified, equivalent to --xml-version=2 in cppcheck"
    echo "  [files or paths]  A list of source files or directories containing source files"
    echo "Example usage:"
    echo "  `basename $0` -l warning -x 2> cppcheck.xml"
}

# If no parameters are provided, print the ha(e)lp message and exit
if [ $# -eq 0 ]; then
    print_halp
    exit 0
fi

# CPPCHECK_LEVEL: Equivalent to --enable option in `cppcheck`
# It must be one of the following: all, warning, style, performance, portability,
#                                  information, unusedFunction, missingInclude
# This parameter is required
unset CPPCHECK_LEVEL

# OUTPUT_FORMAT: When specified, it is equivalent to --xml-version option
#                in `cppcheck`
# This parameter is not required
OUTPUT_FORMAT=""

# SOURCES: A list of source files or paths containing source files
unset SOURCES

while [ "$1" != "" ]; do
    case $1 in
        -l | --level )
            shift
            CPPCHECK_LEVEL=$1
            ;;
        -x | --xml )
            OUTPUT_FORMAT="--xml-version=2"
            ;;
        -h | --help )
            print_halp
            exit 0
            ;;
        * )
            if [ -z "${CPPCHECK_LEVEL+x}" ]; then
                print_halp
                exit 1
            else
                SOURCES="${SOURCES} $1"
            fi
    esac
    shift
done

# CPPCHECK_LEVEL must be specified
if [ -z "${CPPCHECK_LEVEL+x}" ]; then
    print_halp
    exit 1
fi

# If no source files or paths were specified, set it to the current directory
if [ "${SOURCES}" == "" ]; then
    SOURCES="."
fi

echo "CPPCHECK_LEVEL => ${CPPCHECK_LEVEL}"
echo "OUTPUT_FORMAT => ${OUTPUT_FORMAT}"
echo "SOURCES => ${SOURCES}"

CPPCHECK="/usr/bin/env cppcheck"
CPPCHECK_OPTIONS="--enable=${CPPCHECK_LEVEL} --force --library=c755a.cfg"

# Build a string of -I (include path) for `cppcheck` to use
unset INCLUDES
for dir in `find ${PWD} -name "*.h*" -exec dirname {} \; | sort -u`; do
    INCLUDES="${INCLUDES} -I ${dir}"
done

echo "Executing ${CPPCHECK} ${CPPCHECK_OPTIONS} ${OUTPUT_FORMAT} ${INCLUDES} ${SOURCES}"
${CPPCHECK} ${CPPCHECK_OPTIONS} ${OUTPUT_FORMAT} ${INCLUDES} ${SOURCES}
