include(CTest)
if(NOT BUILD_TESTING)
  return()
endif()

include(CompileOptions)
include(Conan)

find_package(Catch2 REQUIRED)
find_package(fmt REQUIRED)

macro(construct_test name)
    add_executable(${name} ${ARGN})
    target_link_libraries(${name} PRIVATE catch2::catch2_with_main fmt::fmt)
    add_test(NAME ${name} COMMAND ${name})
endmacro()

construct_test(test_name main.cpp)
target_compile_options(test_name PRIVATE ${warnings})
