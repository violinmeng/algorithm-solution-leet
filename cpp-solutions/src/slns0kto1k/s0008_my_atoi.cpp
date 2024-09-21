#include <string>
#include <unordered_map>
#include <iostream>
#include <vector>
#include <iostream>

using namespace std;

struct EnumClassHash {
    template <typename T>
    std::size_t operator()(T t) const {
        return static_cast<std::size_t>(t);
    }
};

/**
 * enum usage
 * hash map with enum as the key
*/

class Automaton {
    enum State : int {
        start,
        signed_state,
        in_number,
        end,
    };

    State state = start;
    unordered_map<State, vector<State>, EnumClassHash> table = {
        {start, {start, signed_state, in_number, end}},
        {signed_state, {end, end, in_number, end}},
        {in_number, {end, end, in_number, end}},
        {end, {end, end, end, end}}
    };


    int get_col(char c) {
        if (isspace(c)) return 0;
        if (c == '+' or c == '-') return 1;
        if (isdigit(c)) return 2;
        return 3;
    }
public:
    int sign = 1;
    long long ans = 0;
    void get(char c) {
        state = table[state][get_col(c)];
        if (state == in_number) {
            ans = ans * 10 + c - '0';
            ans = sign == 1 ? min(ans, (long long)INT_MAX) : min(ans, -(long long)INT_MIN);
        }
        else if (state == signed_state) {
            sign = c == '+' ? 1 : -1;
        }
    }

    void print() {
        for (const auto &t : table) {
            cout << t.first << t.second[0] << endl;
        }
    }
};

int myAtoi(string str) {
    Automaton automation;
    for (char c : str) {
        automation.get(c);
    }
    return automation.sign * automation.ans;
}

int main () {
    Automaton automation;
    // automation.print();
    cout << myAtoi("  -134gba") << endl;
    return 0;
}