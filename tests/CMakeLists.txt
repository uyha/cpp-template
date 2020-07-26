macro(construct_test name)
    add_executable(${name} main.cpp ${ARGN})
    add_test(${name} ${name})
endmacro()

construct_test(test_name)
