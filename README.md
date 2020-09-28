# A template for C++ projects
![C/C++ CI](https://github.com/uyha/cpp_template/workflows/C/C++%20CI/badge.svg)

This is a template to start a new C++ project with dependency management built
 into it. Hence, it is opinionated about how dependency management of a C++ 
 project can be done. This template uses `conan` to manage C++'s dependency. In
 addition to that, if Python is needed for the project, it also uses `pipenv` or
 `poetry` to manage Python's virtual environments and its dependencies.

## Requirements
* `cmake`
* `conan`

## Usage
Just clone/download the project or click the [Use this template](https://github.com/uyha/cpp_template/generate)
 button if you're using Github as your git hosting site and start coding.

Users are encouraged to learn a bit about how [conan](https://docs.conan.io/en/latest/getting_started.html)
 works to better understand the `conanfile.txt` and how to add more
 dependencies. If the CMake scripts can't find `conan` automatically, please
 help it by providing `-DCONAN_DIR=/path/to/conan/directory`.

### Miscellaneous
To opt out of using `pipenv` or `poetry`, delete the Pipfile or pyproject.toml,
 respectively, at the project's root.

[Pitchfork]: https://api.csswg.org/bikeshed/?force=1&url=https://raw.githubusercontent.com/vector-of-bool/pitchfork/develop/data/spec.bs
