add_library(slns0kto1k STATIC
    include/slns0kto1k.h
    s0001_twosum.cpp
    s0002_add_two_numbers.cpp
)

target_link_libraries(slns0kto1k PUBLIC base)
target_include_directories(slns0kto1k PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)