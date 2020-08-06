cmake_minimum_required(VERSION 3.8)
project("ProjectName"
        VERSION 0.0
        LANGUAGES CXX)
include(CTest)
execute_process(
        COMMAND conan install ${CMAKE_SOURCE_DIR} -if ${CMAKE_BINARY_DIR}
)
include(${CMAKE_BINARY_DIR}/conan_paths.cmake)

add_subdirectory(src)
add_subdirectory(tests)

add_executable(main "main.cpp")
target_compile_features(main PRIVATE cxx_std_20)
