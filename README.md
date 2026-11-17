# Conditional Dependencies

A header-only C++20 library for exposing and looking up optional mod APIs on Quest.

## Build and package

With QPM2, CMake 3.25+, Ninja, and PowerShell installed:

```sh
qpm2 restore
qpm2 ndk resolve -d
qpm2 build
qpm2 qpkg
```

The build compiles the two existing Android ARM64 test libraries with NDK 29,
targeting Android API 24. The QPKG contains only the public headers; it does not
include the test libraries. This package does not produce a QMOD.

## Using the headers

Declare `conditional-dependencies` and `scotland2` in your QPM2 dependencies.
Scotland2 is also a direct dependency of consumers because the headers call its
loader API, and QPM2 only copies direct dependencies' binaries into `extern/libs`.
Link `libsl2.so`, Android logging, and the dynamic loader, and define your mod's
`MOD_ID` and `VERSION` as string literals before including:

```cpp
#include "conditional-dependencies/main.hpp"
```

The QPM2 include path no longer contains the old `shared/` component.

## CI

Branch and pull-request builds upload the QPKG and the two test libraries as CI
artifacts. Version tags (`v*`) publish the header-only package with QPM Action v2
using the repository's `QPM_TOKEN` secret and the action's default caching.
