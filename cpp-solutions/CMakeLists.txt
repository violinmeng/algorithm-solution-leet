cmake_minimum_required(VERSION 3.10)
project(LeetCodeSolutions)

set(CMAKE_CXX_STANDARD 14)

# 启用 clang-tidy
if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  find_program(CLANG_TIDY_EXE NAMES clang-tidy)
  if(CLANG_TIDY_EXE)
    set(CMAKE_CXX_CLANG_TIDY ${CLANG_TIDY_EXE})
  endif()
endif()

# 添加基础库
add_library(base INTERFACE)
target_include_directories(base INTERFACE include)

# 添加子目录
add_subdirectory(src/slns0kto1k)
add_subdirectory(src/slns1kto2k)
add_subdirectory(main)

# 启用测试
enable_testing()
add_subdirectory(tests)

# 添加Google Test
add_subdirectory(third_party/googletest)