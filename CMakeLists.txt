cmake_minimum_required(VERSION 3.8)
project("ProjectName"
        VERSION 0.0
        LANGUAGES CXX)

include(cmake/conan.cmake)

add_subdirectory(external)
add_subdirectory(src)
add_subdirectory(tests)

