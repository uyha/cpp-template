# pylint: disable=missing-class-docstring, too-few-public-methods,
# pylint: disable=missing-function-docstring, missing-module-docstring,

from conan import ConanFile  # pylint: disable=import-error


class ProjectNameTest(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps"

    def requirements(self):
        dependencies = [
            "fmt/10.1.1",
            "catch2/3.4.0",
        ]

        for dep in dependencies:
            self.requires(dep)
