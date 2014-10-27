# /tests/AddTestTargetLinkedToMatchers.cmake
# Tests that the correct targets are set up when
# adding a Google Test based test
#
# See LICENCE.md for Copyright information

include (PolysquareCommon)
include (CMakeUnit)
include (ExportCfgIntDirHelper)

polysquare_gmock_bootstrap ()

set (MAIN_LIBRARY_SOURCE_FILE ${CMAKE_CURRENT_SOURCE_DIR}/MainLibrary.cpp)
set (MAIN_LIBRARY_SOURCE_FILE_CONTENTS
     "#include <gtest/gtest.h>\n"
     "int main (int argc, char **argv)\n"
     "{\n"
     "    ::testing::InitGoogleTest (&argc, argv)\;\n"
     "    return RUN_ALL_TESTS ()\;\n"
     "}\n")
file (WRITE ${MAIN_LIBRARY_SOURCE_FILE}
      ${MAIN_LIBRARY_SOURCE_FILE_CONTENTS})

set (TEST_SOURCE_FILE ${CMAKE_CURRENT_SOURCE_DIR}/Test.cpp)
set (TEST_SOURCE_FILE_CONTENTS
     "#include <gtest/gtest.h>\n"
     "#include <gmock/gmock.h>\n"
     "TEST(Sample, Test)\n"
     "{\n"
     "    EXPECT_TRUE(true)\;\n"
     "}\n")
file (WRITE ${TEST_SOURCE_FILE}
      ${TEST_SOURCE_FILE_CONTENTS})

polysquare_add_test_main (test_main
                          SOURCES ${MAIN_LIBRARY_SOURCE_FILE})

polysquare_add_test (unittest
                     SOURCES ${TEST_SOURCE_FILE}
                     MAIN_LIBRARY test_main)

assert_target_is_linked_to (unittest test_main)