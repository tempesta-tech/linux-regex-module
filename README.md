# eBPF REGEX helper

The `linux-rex` is a loadable kernel module providing eBPF helper functions
for processing regular expressions. It uses Hyperscan as a runtime and
configuration tool.

License: GPLv2

## Documentation

Refer to [the project wiki pages](https://github.com/G-Core/linux-regex-module/wiki)
to find all the necessary documentation.

## Talks and videos

The `linux-rex` module [was introduced on the Netdev 0x16, Technical Conference
on Linux Networking](https://netdevconf.info/0x16/session.html?When-regular-expressions-meet-XDP#)

## Hyperscan

Hyperscan is a high-performance multiple regex matching library. It follows the
regular expression syntax of the commonly-used libpcre library, but is a
standalone library with its own C API.

Hyperscan uses hybrid automata techniques to allow simultaneous matching of
large numbers (up to tens of thousands) of regular expressions and for the
matching of regular expressions across streams of data.

Hyperscan is typically used in a DPI library stack.

More information can be found at
[Hyperscan project repo](https://github.com/intel/hyperscan)

License: BSD

## Build

```
git clone https://github.com/tempesta-tech/linux-regex-module.git

cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cd build
make
```

## TODO
We need this repository for several reasons. It is used to build both hscollider and the Debian package for it, and this cannot be built using only what already exists in the Tempesta repository. It also contains documentation and tests. Other tools from the repository may also prove useful.

But there is one drawback to having this repository.: it diverges from what is in the Tempesta repository.

We can solve this in several ways:

1. Move everything except the kernel part from this repository into the Tempesta repository, but place it in a separate directory from the kernel regex code. To build the non-kernel part, we could simply create a symlink to the kernel part, since it is also used in building the non-kernel components. I haven’t verified this 100%, but it should work if we add the necessary files into the `tempesta/regex` directory. If we don’t add them there, we could instead modify the build file - that would take a bit longer but would be cleaner. The result would be:

   * everything needed to build both the kernel and userspace parts would be in `tempesta/regex`
   * everything needed only for userspace would be in a separate directory.

2. Same as the first option, but without separating kernel and userspace parts. Just copy the entire repository into a single directory inside Tempesta. Then load the kernel module and package the `.deb` from there.

3. Make the repository a submodule. Create an `externals` directory in Tempesta (or any other separate directory), keep submodules there, and build both the kernel module and hscollider there as well. All changes would then be made in that repository.
