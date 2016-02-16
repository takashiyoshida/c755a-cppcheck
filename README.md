# c755a-cppcheck

cppcheck configuration for C755A source code

## Requirement

cppcheck version 1.72

> At this point, I don't know if cppcheck 1.72 builds under RHEL 5.


```bash
cppcheck --library=test.cfg -I ../include -I ../mdbdef -I ../scsint/inc -I inc -I ../classes/inc -I ../tools/inc -I ../sal/inc -I ../sta/inc -I ../reg/inc -I ../sigint/inc  --enable=all --force src 2> cppcheck.log
```
