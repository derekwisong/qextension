# qextension

An example q/kdb+ extension — C functions built into a shared library and loaded
into q with `2:`.

`extension.c` defines two functions that print a q string; `extension.q` loads
them from `build/extension.so`.

## Build

```
make
```

Fetches `k.h` and compiles `build/extension.so`. `make header` fetches the header
on its own.

## Run

```
q extension.q
q)print "test"
q)print2 "test"
```

## License

MIT
