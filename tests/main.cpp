#include <catch2/catch_test_macros.hpp>
#include <fmt/format.h>

TEST_CASE("Basic test") {
  CHECK(fmt::format("Hello, {}", "World") == "Hello, World");
}
