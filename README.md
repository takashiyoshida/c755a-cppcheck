# c755a-cppcheck

__c755a-cppcheck__ is a set of shell script and [cppcheck](https://github.com/danmar/cppcheck) configuration for C755A project.

## Requirement

- [cppcheck](https://github.com/danmar/cppcheck) version 1.72 or later

## Installation

Copy `kcehcppc.sh` and `c755a.cfg` files to the root of C755A source repository.

```bash
cp kcehcppc.sh c755a.cfg c755a-src
```

## Running Script

```bash
./kcehcppc.sh -l warning tmc/enc
```

You can redirect the output from `cppcheck` to a separate file like this.

```bash
./kcehcppc.sh -l warning tmc/enc 2> cppcheck.txt
```

You can also produce `cppcheck` output in XML format so that you can use `cppcheck-htmlreport` with it.

```bash
./kcehcppc.sh -l warning -x tmc/enc 2> cppcheck.xml
cppcheck-htmlreport --title="tmc/enc" --file=cppcheck.xml --report-dir=cppcheck
```
