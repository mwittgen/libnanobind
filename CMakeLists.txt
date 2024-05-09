cmake_minimum_required(VERSION 3.15...3.26)

project(nanobind_shared LANGUAGES CXX)
include(GNUInstallDirs)
include(FetchContent)

find_package(Python
  REQUIRED COMPONENTS Interpreter Development.Module
  OPTIONAL_COMPONENTS Development.SABIModule)

FetchContent_Declare(
  nanobind
  GIT_REPOSITORY https://github.com/wjakob/nanobind
  OVERRIDE_FIND_PACKAGE
)
FetchContent_Populate(nanobind)

#list(APPEND CMAKE_PREFIX_PATH "${NB_DIR}")
#find_package(nanobind CONFIG REQUIRED)
add_subdirectory(${nanobind_SOURCE_DIR})
nanobind_add_module(
  test_nanobind
  STABLE_ABI
  NB_SHARED
  tests/test_nanobind.cpp
)

install(TARGETS nanobind LIBRARY DESTINATION "${CMAKE_INSTALL_PREFIX}/lib")
install(DIRECTORY "${nanobind_SOURCE_DIR}/include/nanobind"
	DESTINATION "${CMAKE_INSTALL_PREFIX}/include" FILES_MATCHING PATTERN "*.h*")
