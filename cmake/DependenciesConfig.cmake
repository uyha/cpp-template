find_package(Pipenv REQUIRED CONFIG)

set(ENV{PIPENV_IGNORE_VIRTUALENVS} 1)
if (${CMAKE_SOURCE_DIR}/Pipfile IS_NEWER_THAN ${CMAKE_SOURCE_DIR}/Pipfile.lock)
    message(STATUS "Installing python requirements from Pipfile")
    execute_process(
            COMMAND ${Pipenv_EXECUTABLE} install
            RESULT_VARIABLE error
            ERROR_VARIABLE error_message
    )
    if (error)
        message(FATAL_ERROR "${error}")
    endif ()
endif ()

if (${CMAKE_SOURCE_DIR}/conanfile.txt IS_NEWER_THAN ${CMAKE_BINARY_DIR}/conan.lock)
    message(STATUS "Installing dependencies from conanfile.txt")
    execute_process(
            # build_type needs to be specified so MSVC can link
            COMMAND ${Pipenv_EXECUTABLE} run conan install ${CMAKE_SOURCE_DIR} -if ${CMAKE_BINARY_DIR} -s build_type=${CMAKE_BUILD_TYPE}
            RESULT_VARIABLE error
            ERROR_VARIABLE error_message
    )
    if (error)
        if (error_message)
            message(FATAL_ERROR "${error_message}")
        else ()
            message(FATAL_ERROR "${error}")
        endif ()
    endif ()
endif ()
set(CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR} ${CMAKE_MODULE_PATH})
