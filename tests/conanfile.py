from conan import ConanFile


class ProjectNameTest(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps"

    def requirements(self):
        dependencies = ["fmt/9.1.0", "catch2/3.3.2"]

        for dep in dependencies:
            self.requires(dep)
