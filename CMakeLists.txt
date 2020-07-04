cmake_minimum_required(VERSION 3.8)
project("ProjectName"
        VERSION 0.0
        LANGUAGES CXX)
include(CTest)

add_subdirectory(external)
add_subdirectory(src)
add_subdirectory(tests)

add_executable(main "main.cpp")
target_compile_features(main PRIVATE cxx_std_20)
