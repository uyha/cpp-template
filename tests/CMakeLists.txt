find_package(Catch2)

macro(construct_test name)
    add_executable(${name} main.cpp ${ARGN})
    target_link_libraries(${name} PRIVATE Catch2::Catch2)
    add_test(
            NAME ${name}
            COMMAND ${name})
endmacro()

construct_test(test_name)
