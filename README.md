# c755a-cppcheck

cppcheck configuration for C755A source code

## Requirement

You must install [cppcheck](https://github.com/danmar/cppcheck/) version 1.72 or later.

> I do not know if `cppcheck` can be built under RedHat Enterprise Linux 5.
> The included script, `kcehcppc.sh`, and its configuration file were developed and tested under OS X El Capitan and Ubuntu.
> You may be able to build `cppcheck` and use the `kcehcppc.sh` under your environment. If you are successful in doing so, please let me know.

Install the script by copying `kcehcppc.sh` and `tmc.cfg` to `tmc` directory in your C755A source repository.

```bash
% cp kcehcppc.sh tmc.cfg c755a-src/tmc
% kcehcppc.sh all .
```

You can redirect the output from `cppcheck` to a separate file like this:

```bash
% kcehcppc.sh all . 2> cppcheck.log
```

You can also specify different check level and path.

```bash
% kcehcppc.sh warning enc/src 2> cppcheck.log
```
