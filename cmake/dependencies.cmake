include(pipenv)
set(ENV{PIPENV_IGNORE_VIRTUALENVS} 1)
if (${CMAKE_SOURCE_DIR}/Pipfile IS_NEWER_THAN ${CMAKE_SOURCE_DIR}/Pipfile.lock)
    execute_process(
            COMMAND ${pipenv_EXECUTABLE} install
            RESULT_VARIABLE error
            ERROR_VARIABLE error_message
    )
    if (error)
        message(FATAL_ERROR "${error}")
    endif ()
endif ()

if (${CMAKE_SOURCE_DIR}/conanfile.txt IS_NEWER_THAN ${CMAKE_BINARY_DIR}/conan.lock)
    execute_process(
            COMMAND ${pipenv_EXECUTABLE} run conan install ${CMAKE_SOURCE_DIR} -if ${CMAKE_BINARY_DIR}
            RESULT_VARIABLE error
            ERROR_VARIABLE error_message
    )
    if (error)
        message(FATAL_ERROR "${error_message}")
    endif ()
endif ()
set(CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR} ${CMAKE_MODULE_PATH})
