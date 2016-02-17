#!/bin/sh

print_halp()
{
    echo "Usage: $0 -l LEVEL [-x] [files or paths]"
    echo "-l, --level"
    echo "-x, --xml"
}

if [ $# -eq 0 ]; then
    print_halp
    exit 0
fi

unset CPPCHECK_LEVEL
OUTPUT_FORMAT=""
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

if [ -z "${CPPCHECK_LEVEL+x}" ]; then
    print_halp
    exit 1
fi

if [ "${SOURCES}" == "" ]; then
    SOURCES="."
fi

echo "CPPCHECK_LEVEL => ${CPPCHECK_LEVEL}"
echo "OUTPUT_FORMAT => ${OUTPUT_FORMAT}"
echo "SOURCES => ${SOURCES}"

CPPCHECK="/usr/bin/env cppcheck"
CPPCHECK_OPTIONS="--enable=${CPPCHECK_LEVEL} --force --library=c755a.cfg"

unset INCLUDES
for dir in `find ${PWD} -name "*.h*" -exec dirname {} \; | sort -u`; do
    INCLUDES="${INCLUDES} -I ${dir}"
done

#echo "INCLUDES => ${INCLUDES}"

echo "Executing ${CPPCHECK} ${CPPCHECK_OPTIONS} ${OUTPUT_FORMAT} ${INCLUDES} ${SOURCES}"
${CPPCHECK} ${CPPCHECK_OPTIONS} ${OUTPUT_FORMAT} ${INCLUDES} ${SOURCES}
