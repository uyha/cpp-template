if (NOT Pipenv_FOUND)
    find_package(Python REQUIRED)

    execute_process(
            COMMAND ${Python_EXECUTABLE} -c "import sys; print(sys.prefix)"
            RESULT_VARIABLE result
            OUTPUT_VARIABLE output
            ERROR_VARIABLE error
    )
    message(STATUS "Fining Pipenv")
    find_program(
            Pipenv_EXECUTABLE
            pipenv
            PATHS ${output}
            REQUIRED
    )
    message(STATUS "Found Pipenv at ${Pipenv_EXECUTABLE}")
    set(Pipenv_EXECUTABLE "${Pipenv_EXECUTABLE}" CACHE INTERNAL "")
    set(Pipenv_FOUND TRUE CACHE INTERNAL "")
endif ()