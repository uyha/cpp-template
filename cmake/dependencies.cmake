include(pipenv OPTIONAL RESULT_VARIABLE pipenv_include)

if (Pipenv_FOUND AND NOT CONAN_CMD)
    message(STATUS "pipenv is found at :${PIPENV_EXECUTABLE}, trying to find conan from pipenv")
    pipenv_install()
    pipenv_watch()
    message(STATUS ${PIPENV_ROOT})
    find_program(
            CONAN_CMD conan
            PATHS ${PIPENV_ROOT}/Scripts ${PIPENV_ROOT}/bin
    )
    if (CONAN_CMD_NOTFOUND)
        unset(CONAN_CMD)
    else ()
        set(CONAN_CMD ${CONAN_CMD} CACHE TYPE INTERNAL)
    endif ()
endif ()

if (NOT EXISTS ${CMAKE_BINARY_DIR}/conan.cmake)
    message(STATUS "Downloading conan.cmake")
    file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
            "${CMAKE_BINARY_DIR}/conan.cmake")
endif ()
include(${CMAKE_BINARY_DIR}/conan.cmake)
if (${CMAKE_SOURCE_DIR}/conanfile.txt IS_NEWER_THAN ${CMAKE_BINARY_DIR}/conan.lock)
    conan_cmake_run(
            CONANFILE conanfile.txt
    )
endif ()
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_BINARY_DIR})

