# pylint: disable=missing-class-docstring, too-few-public-methods,
# pylint: disable=missing-function-docstring, missing-module-docstring,

from conan import ConanFile  # pylint: disable=import-error


class ProjectNameTest(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps"

    def requirements(self):
        dependencies = [
            "fmt/9.1.0",
            "catch2/3.3.2",
        ]

        for dep in dependencies:
            self.requires(dep)
