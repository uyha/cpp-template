if (NOT Pipenv_FOUND)
    find_package(Python REQUIRED)

    execute_process(
            COMMAND ${Python_EXECUTABLE} -c "import sys; print(sys.prefix)"
            OUTPUT_VARIABLE python_root
    )

    message(STATUS "Finding Pipenv")
    find_program(
            Pipenv_EXECUTABLE
            pipenv
            PATHS ${python_root}
    )

    if(Pipenv_EXECUTABLE_NOTFOUND)
      message(FATAL_ERROR "pipenv could not be found at ${python_root}, please make sure it is installed")
    endif()

    message(STATUS "Found Pipenv at ${Pipenv_EXECUTABLE}")
    set(Pipenv_EXECUTABLE "${Pipenv_EXECUTABLE}" CACHE INTERNAL "")
    set(Pipenv_FOUND TRUE CACHE INTERNAL "")
endif ()