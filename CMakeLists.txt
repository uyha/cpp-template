cmake_minimum_required(VERSION 3.12)
project("ProjectName"
        VERSION 1.0.0
        LANGUAGES CXX)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})

add_subdirectory(include)
add_subdirectory(src)
add_subdirectory(tests)
