find_program(Conda_EXECUTABLE conda HINTS ${Conda_DIR} ${Conda_DIR}/bin ${Conda_DIR}/Scripts)

if (Conda_EXECUTABLE AND NOT Conda_FOUND)
    if (NOT TARGET Conda::Conda)
        add_executable(Conda::Conda IMPORTED)
        set_target_properties(Conda::Conda PROPERTIES IMPORTED_LOCATION "${Conda_EXECUTABLE}")
    endif ()
endif ()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Conda DEFAULT_MSG Conda_EXECUTABLE)
