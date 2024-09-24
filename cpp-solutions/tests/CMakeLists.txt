add_executable(test_all
    test_0kto1k_solutions.cpp
    test_1kto2k_solutions.cpp
)

target_link_libraries(test_all
    gtest_main
    slns0kto1k
    slns1kto2k
)

include(GoogleTest)
gtest_discover_tests(test_all)