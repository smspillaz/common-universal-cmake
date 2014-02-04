# /tests/NoCPPCheckOptionVerify.cmake
# Reads the build output to make sure that cppcheck was never run as part of
# the build.
#
# See LICENCE.md for Copyright information

include (${POLYSQUARE_COMMON_UNIVERSAL_CMAKE_TESTS_DIRECTORY}/CMakeUnit.cmake)

set (BUILD_OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/BUILD.output)

assert_file_does_not_contain (${BUILD_OUTPUT} "cppcheck")
