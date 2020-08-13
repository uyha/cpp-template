find_program(PIPENV pipenv)

if (NOT PIPENV)
    message(FATAL_ERROR "Please install pipenv for setting up development environment")
endif ()

execute_process(
        COMMAND ${PIPENV} --bare install
        RESULT_VARIABLE error
        ERROR_VARIABLE error_message
)

if (error)
    message(FATAL_ERROR "${error_message}")
endif ()

if (${CMAKE_SOURCE_DIR}/conanfile.txt IS_NEWER_THAN ${CMAKE_BINARY_DIR}/conan.lock)
    execute_process(COMMAND ${PIPENV} run conan install ${CMAKE_SOURCE_DIR} -if ${CMAKE_BINARY_DIR})
endif ()
set(CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR} ${CMAKE_MODULE_PATH})
