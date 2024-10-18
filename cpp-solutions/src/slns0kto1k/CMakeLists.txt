add_library(slns0kto1k STATIC
    include/slns0kto1k.h
    s0001_twosum.cpp
    s0002_add_two_numbers.cpp
    s0003_length_of_longest_substring.cpp
    s0007_reverse_int.cpp
    s0206_reverse_list.cpp
    s0012_int_to_roman.cpp
)

target_link_libraries(slns0kto1k PUBLIC base)
target_include_directories(slns0kto1k PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)