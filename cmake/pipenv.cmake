if (NOT DEFINED pipenv_EXECUTABLE)
    find_package(Python REQUIRED)

    execute_process(
            COMMAND ${Python_EXECUTABLE} -c "import sys; print(sys.prefix)"
            RESULT_VARIABLE result
            OUTPUT_VARIABLE output
            ERROR_VARIABLE error
    )
    message(STATUS "Fining pipenv")
    find_program(
            pipenv_EXECUTABLE
            pipenv
            PATHS ${output}
            REQUIRED
    )
    message(STATUS "Found pipenv at ${pipenv_EXECUTABLE}")
    set(pipenv_EXECUTABLE "${pipenv_EXECUTABLE}" CACHE INTERNAL "")
endif ()