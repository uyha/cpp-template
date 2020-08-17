# A template for C++ projects

This is a template to start a new C++ project with dependency management built
 into it. Hence, it is opinionated about how dependency management of a C++ 
 project can be done. This template uses `conan` to manage C++'s dependency. In
 addition to that, if Python is needed for the project, it also uses `pipenv` to
 manage Python's virtual environments and its dependencies.

## Requirements
* `cmake`
* `conan`

## Usage
Just clone or download the project and start coding.

To opt out of using `pipenv` for finding `conan`, delete the Pipfile at the
 project's root.

[Pitchfork]: https://api.csswg.org/bikeshed/?force=1&url=https://raw.githubusercontent.com/vector-of-bool/pitchfork/develop/data/spec.bs
