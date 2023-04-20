find_program(Poetry_EXECUTABLE poetry HINTS "${Poetry_DIR}")

if(Poetry_EXECUTABLE)
  if(NOT TARGET Poetry::Poetry)
    add_executable(Poetry::Poetry IMPORTED)
    set_target_properties(Poetry::Poetry PROPERTIES IMPORTED_LOCATION "${Poetry_EXECUTABLE}")
  endif()
  if(WIN32)
    execute_process(
      COMMAND cmd /C "${Poetry_EXECUTABLE}" --version
      RESULT_VARIABLE result
      OUTPUT_VARIABLE version
      )
  else()
    execute_process(
      COMMAND "${Poetry_EXECUTABLE}" --version
      RESULT_VARIABLE result
      OUTPUT_VARIABLE version
      )
  endif()
  if(result EQUAL 0)
    if(${version} MATCHES ".*version(.*)")
      string(STRIP ${CMAKE_MATCH_1} Poetry_VERSION)
    endif()
  endif()

  function(poetry_install)
    set(options ";")
    set(single_values DIR)
    set(multi_values OPTIONS)
    cmake_parse_arguments(arg "${options}" "${single_values}" "${multi_values}" ${ARGN})
    if(NOT DEFINED arg_DIR)
      set(arg_DIR "${CMAKE_CURRENT_BINARY_DIR}")
      message(NOTICE "DIR is not set, defaulting ${arg_DIR}")
    endif()
    if(WIN32)
      execute_process(COMMAND "${CMAKE_COMMAND}" -E chdir "${arg_DIR}" cmd /C "${Poetry_EXECUTABLE}" install ${arg_OPTIONS})
    else()
      execute_process(COMMAND "${CMAKE_COMMAND}" -E chdir "${arg_DIR}" "${Poetry_EXECUTABLE}" install ${arg_OPTIONS})
    endif()
  endfunction()

  function(poetry_update)
    set(options ";")
    set(single_values DIR)
    set(multi_values OPTIONS)
    cmake_parse_arguments(arg "${options}" "${single_values}" "${multi_values}" ${ARGN})
    if(NOT DEFINED arg_DIR)
      set(arg_DIR ${CMAKE_CURRENT_BINARY_DIR})
      message(NOTICE "DIR is not set, defaulting ${arg_DIR}")
    endif()
    if(WIN32)
      execute_process(COMMAND "${CMAKE_COMMAND}" -E chdir "${arg_DIR}" cmd /C "${Poetry_EXECUTABLE}" update ${arg_OPTIONS})
    else()
      execute_process(COMMAND "${CMAKE_COMMAND}" -E chdir "${arg_DIR}" "${Poetry_EXECUTABLE}" update ${arg_OPTIONS})
    endif()
  endfunction()

  macro(_poetry_lock_add_flag option flag)
    if(arg_${option})
      list(APPEND optional_arguments ${flag})
    endif()
  endmacro()
  function(poetry_lock)
    set(options "CHECK;NO_UPDATE")
    set(single_values "DIR")
    set(multi_values ";")
    cmake_parse_arguments(arg "${options}" "${single_values}" "${multi_values}" ${ARGN})

    if(NOT DEFINED arg_DIR)
      set(arg_DIR ${CMAKE_CURRENT_BINARY_DIR})
      message(NOTICE "DIR is not set, defaulting ${arg_DIR}")
    endif()

    _poetry_lock_add_flag(CHECK --check)
    _poetry_lock_add_flag(NO_UPDATE --no-update)

    if(WIN32)
      execute_process(COMMAND "${CMAKE_COMMAND}" -E chdir "${arg_DIR}" cmd /C "${Poetry_EXECUTABLE}" lock ${optional_arguments})
    else()
      execute_process(COMMAND "${CMAKE_COMMAND}" -E chdir "${arg_DIR}" "${Poetry_EXECUTABLE}" lock ${optional_arguments})
    endif()
  endfunction()

  function(poetry_path out)
    set(options ";")
    set(single_values DIR)
    set(multi_values ";")
    cmake_parse_arguments(arg "${options}" "${single_values}" "${multi_values}" ${ARGN})
    if(NOT DEFINED arg_DIR)
      set(arg_DIR ${CMAKE_CURRENT_BINARY_DIR})
      message(NOTICE "DIR is not set, defaulting to ${arg_DIR}")
    endif()

    if(WIN32)
      execute_process(COMMAND "${CMAKE_COMMAND}" -E chdir "${arg_DIR}" cmd /C "${Poetry_EXECUTABLE}" env info --path
        RESULT_VARIABLE result
        OUTPUT_VARIABLE output)
    else()
      execute_process(COMMAND "${CMAKE_COMMAND}" -E chdir "${arg_DIR}" "${Poetry_EXECUTABLE}" env info --path
        RESULT_VARIABLE result
        OUTPUT_VARIABLE output)
    endif()

    string(STRIP "${output}" output)
    set("${out}" "${output}" PARENT_SCOPE)
  endfunction()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Poetry
  REQUIRED_VARS Poetry_EXECUTABLE
  VERSION_VAR Poetry_VERSION)
