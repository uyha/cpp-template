find_program(CCACHE_EXECUTABLE ccache)
if(CCACHE_EXECUTABLE)
  foreach(lang IN ITEMS C CXX OBJC OBJCXX CUDA)
    set(CMAKE_${lang}_COMPILER_LAUNCHER
      "${CMAKE_COMMAND}" -E env CCACHE_SLOPPINESS=pch_defines,time_macros "${CCACHE_EXECUTABLE}" PARENT_SCOPE)
  endforeach()
endif()
