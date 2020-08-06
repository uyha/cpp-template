cmake_minimum_required(VERSION 3.8)
project("ProjectName"
        VERSION 0.0
        LANGUAGES CXX)

include(CTest)

if (${CMAKE_SOURCE_DIR}/conanfile.txt IS_NEWER_THAN ${CMAKE_BINARY_DIR}/conan.lock)
    execute_process(COMMAND conan install ${CMAKE_SOURCE_DIR} -if ${CMAKE_BINARY_DIR})
endif ()
set(CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR} ${CMAKE_MODULE_PATH})

add_subdirectory(external)
add_subdirectory(src)
add_subdirectory(tests)

