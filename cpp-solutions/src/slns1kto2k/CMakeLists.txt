add_library(slns1kto2k STATIC
    slns1kto2k.h
    s1024_video_stitching.cpp
)

target_link_libraries(slns1kto2k PUBLIC base)