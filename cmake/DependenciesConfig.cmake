find_package(Pipenv REQUIRED CONFIG)

# Compare to see if the content of Pipfile in the build directory is different
# than the one in the source directory. If they are different, then copy the
# Pipfile in the source directory to the build directory.
execute_process(
        COMMAND ${CMAKE_COMMAND} -E compare_files --ignore-eol ${CMAKE_SOURCE_DIR}/Pipfile ${CMAKE_BINARY_DIR}/Pipfile
        RESULT_VARIABLE different_pipfile
        OUTPUT_QUIET
        ERROR_QUIET
)
if (different_pipfile)
    message(STATUS "Copying Pipfile to ${CMAKE_BINARY_DIR}")
    file(COPY ${CMAKE_SOURCE_DIR}/Pipfile DESTINATION ${CMAKE_BINARY_DIR})
endif ()

# If the build directory Pipfile gets changed after Pipfile.lock is generated,
# rerun pipenv install to make sure they are in sync
if (${CMAKE_BINARY_DIR}/Pipfile IS_NEWER_THAN ${CMAKE_BINARY_DIR}/Pipfile.lock)
    message(STATUS "Installing python requirements from Pipfile")
    execute_process(
            COMMAND ${CMAKE_COMMAND} -E chdir ${CMAKE_BINARY_DIR} ${Pipenv_EXECUTABLE} install
            RESULT_VARIABLE error
            ERROR_VARIABLE error_message
    )
    if (error)
        message(FATAL_ERROR "${error}")
    endif ()
endif ()

# If the source directory conanfile gets changed after conan.lock in the build
# directory is generated, rerun pipenv install to make sure they are in sync
if (${CMAKE_SOURCE_DIR}/conanfile.txt IS_NEWER_THAN ${CMAKE_BINARY_DIR}/conan.lock)
    message(STATUS "Installing dependencies from conanfile.txt")
    execute_process(
            # build_type needs to be specified so MSVC can link
            COMMAND ${CMAKE_COMMAND} -E chdir ${CMAKE_BINARY_DIR} ${Pipenv_EXECUTABLE} run conan install ${CMAKE_SOURCE_DIR} -if ${CMAKE_BINARY_DIR} -s build_type=${CMAKE_BUILD_TYPE}
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
set_property(
        DIRECTORY
        APPEND
        PROPERTY CMAKE_CONFIGURE_DEPENDS ${CMAKE_SOURCE_DIR}/Pipfile ${CMAKE_SOURCE_DIR}/conanfile.txt
)
