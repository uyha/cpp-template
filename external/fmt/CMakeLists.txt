add_library(fmt src/format.cc src/os.cc)
add_library(fmt::fmt ALIAS fmt)
target_include_directories(fmt PUBLIC include)