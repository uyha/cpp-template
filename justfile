set positional-arguments

preset := "debug"

build *ARG:
  cmake --build --preset {{preset}} "$@"

config *ARG:
  cmake --preset {{preset}} "$@"
