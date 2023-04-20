find_package(Poetry REQUIRED)

set(poetry_conf "${CMAKE_CURRENT_SOURCE_DIR}/pyproject.toml")

if(NOT EXISTS "${poetry_conf}")
  message(STATUS "No pyproject.toml found, skipping setting Poetry up")
  return()
endif()

if("${poetry_conf}" IS_NEWER_THAN "${CMAKE_CURRENT_SOURCE_DIR}/poetry.lock")
  poetry_lock(DIR "${CMAKE_CURRENT_SOURCE_DIR}" NO_UPDATE)
  poetry_install(DIR "${CMAKE_CURRENT_SOURCE_DIR}" OPTIONS "--no-root")
  execute_process(COMMAND "${CMAKE_COMMAND}" -E touch "${CMAKE_CURRENT_SOURCE_DIR}/poetry.lock")
endif()

poetry_path(Python_ROOT_DIR DIR "${CMAKE_CURRENT_SOURCE_DIR}")

set(Python_ROOT_DIR "${Python_ROOT_DIR}" CACHE PATH "Path to the root directory of the target Python interpreter")

set_property(
  DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
  APPEND
  PROPERTY CMAKE_CONFIGURE_DEPENDS "${poetry_conf}"
  )

