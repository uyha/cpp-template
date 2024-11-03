===========================
A template for C++ projects
===========================

.. figure:: https://github.com/uyha/cpp_template/workflows/C/C++%20CI/badge.svg
   :alt: C/C++ CI

   C/C++ CI

This is a template to start a new C++ project with dependency management
built into it. Hence, it is opinionated about how dependency management
of a C++ project can be done. This template uses ``conan`` to manage
C++’s dependency.

Requirements
============

- `cmake <https://cmake.org/>`_
- `conan <https://conan.io/>`_
- `ninja <https://ninja-build.org/>`_

Optional
========

- `just <https://just.systems/>`_

Usage
=====

Just clone/download the project or click the `Use this
template <https://github.com/uyha/cpp_template/generate>`__ button if
you’re using Github as your git hosting site and start coding.

Users are encouraged to learn a bit about how `conan <https://docs.conan.io/2/>`__ works
to better understand the ``conanfile.txt`` and how to add more dependencies.

---------------------------------
Configure and build with ``just``
---------------------------------

If you're using ``just``, you can run

.. code:: sh

   just config

to configure the project and

.. code:: sh

   just build

to build the project

-----------------------------------------
Configure and build with normal ``cmake``
-----------------------------------------

If you want to use raw CMake, you should use the preset. To configure the project, you
can run

.. code:: sh

   cmake --preset debug

and to build the project, you can run

.. code:: sh

   cmake --build --preset debug
