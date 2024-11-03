cmake_minimum_required(VERSION 3.12)
project("ProjectName"
        VERSION 1.0.0
        LANGUAGES CXX)

include(FetchContent)
FetchContent_Declare(river
                     GIT_REPOSITORY https://github.com/uyha/cmake-modules.git
                     GIT_TAG v0.4.0)
FetchContent_MakeAvailable(river)
list(APPEND CMAKE_MODULE_PATH "${river_SOURCE_DIR}")

add_subdirectory(include)
add_subdirectory(src)
add_subdirectory(tests)
