add_library(date src/tz.cpp)
add_library(date::date ALIAS date)
target_include_directories(date PUBLIC include)