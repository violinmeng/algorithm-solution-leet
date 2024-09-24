add_library(slns1kto2k STATIC
    include/slns1kto2k.h
    s1024_video_stitching.cpp
    s1095_find_in_mountain_array.cpp
    s1207_unique_occurrences.cpp
)

target_link_libraries(slns1kto2k PUBLIC base)
target_include_directories(slns1kto2k PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)