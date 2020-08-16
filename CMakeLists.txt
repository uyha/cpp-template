cmake_minimum_required(VERSION 3.8)
project("ProjectName"
        VERSION 0.0
        LANGUAGES CXX)

set(CMAKE_PREFIX_PATH ${CMAKE_SOURCE_DIR}/cmake ${CMAKE_PREFIX_PATH})
find_package(Dependencies REQUIRED CONFIG)

add_subdirectory(external)
add_subdirectory(src)
add_subdirectory(tests)

