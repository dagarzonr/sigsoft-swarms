#
# Find the ARGoS package
#
if(ARGOS_BUILD_FOR_SIMULATOR)
  find_package(PkgConfig)
  pkg_check_modules(ARGOS REQUIRED argos3_simulator)
  set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ARGOS_PREFIX}/share/argos3/cmake)
  include_directories(${ARGOS_INCLUDE_DIRS})
  link_directories(${ARGOS_LIBRARY_DIRS})
endif(ARGOS_BUILD_FOR_SIMULATOR)

#
# Check for Qt and OpenGL when compiling for the simulator
#
if(ARGOS_BUILD_FOR_SIMULATOR)
  include(ARGoSCheckQTOpenGL)
endif(ARGOS_BUILD_FOR_SIMULATOR)

#
# Check for Lua 5.2
#
find_package(Lua52)
if(LUA52_FOUND)
  set(ARGOS_WITH_LUA ON)
  include_directories(${LUA_INCLUDE_DIR})
endif(LUA52_FOUND)

