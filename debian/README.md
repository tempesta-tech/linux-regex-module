# Build package

To build the `deb` package, just follow these steps:

1. Install dependencies using `debian/install_deps.sh` or manually. This step requires all packages
   from [here](https://github.com/tempesta-tech/tempesta/wiki/Install-from-Sources#build-requirements)
   and [here](https://github.com/tempesta-tech/tempesta/wiki/Install-from-Sources#install-build-dependencies-1) to be installed.
2. Move `debian` folder from the project root to another location and remove `.git` folder
3. Create `tar.gz` archive by path `../linux-regex_5.4.orig.tar.gz` using `tar -cvzf ../linux-regex_5.4.orig.tar.gz .`
4. Return `debian` folder to the project root
5. Run `debuild -uc -us`.
6. Install created `.deb` package and run `hscollider --help` to test.
