from conan import ConanFile


class ProjectName(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps"

    def requirements(self):
        dependencies = ["fmt/9.1.0"]

        for dep in dependencies:
            self.requires(dep)
