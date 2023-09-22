cmake_minimum_required(VERSION 3.15...3.26)

project(nanobind_shared LANGUAGES CXX)
include(GNUInstallDirs)

find_package(Python
  REQUIRED COMPONENTS Interpreter Development.Module
  OPTIONAL_COMPONENTS Development.SABIModule)

execute_process(
  COMMAND "${Python_EXECUTABLE}" -m nanobind --cmake_dir
  OUTPUT_STRIP_TRAILING_WHITESPACE OUTPUT_VARIABLE NB_DIR)
list(APPEND CMAKE_PREFIX_PATH "${NB_DIR}")

find_package(nanobind CONFIG REQUIRED)

nanobind_add_module(
  test_nanobind
  STABLE_ABI
  NB_SHARED
  tests/test_nanobind.cpp
)

install(TARGETS nanobind LIBRARY DESTINATION "${CMAKE_INSTALL_PREFIX}/lib")
