

## clone this repo
```shell
git submodule update --init --recursive
```

## build
```shell
mkdir build
cd build
cmake ..
make
```

## run tests
```shell
ctest
```

## run main
```shell
./main/leetcode_solutions_main
```

## format and lint

install clang-format and clang-tidy
```shell
brew install llvm
ln -s "$(brew --prefix llvm)/bin/clang-format" "/usr/local/bin/clang-format"
ln -s "$(brew --prefix llvm)/bin/clang-tidy" "/usr/local/bin/clang-tidy"
ln -s "$(brew --prefix llvm)/bin/clang-apply-replacements" "/usr/local/bin/clang-apply-replacements"
```

## Debugging
```shell
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
```

run lldb
```shell
lldb ./main/leetcode_solutions_main
b main.cpp:27
run
```

run gdb
```shell
gdb ./main/leetcode_solutions_main
```

