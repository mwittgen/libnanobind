build() {
  mkdir build
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_VERBOSE_MAKEFILE=On
  cmake --build build --config Release
}

install() {
  die_if_empty PRODUCT
  die_if_empty VERSION

  clean_old_install

  cmake --install build
  install_ups
}
