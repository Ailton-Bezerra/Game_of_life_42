#!/bin/bash

# Compilation
cc -Wall -Wextra -Werror -o game_of_life *.c

# Colors
RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
YELLOW="\033[1;33m"
RESET="\033[0m"

echo -e "${YELLOW}==========================================================${RESET}"
echo -e "${YELLOW}            Game of Life - Test Suite ${RESET}"
echo -e "${YELLOW}==========================================================${RESET}"

run_test() {
    desc="$1"
    input="$2"
    args="$3"

    echo
    echo -e "${BLUE}[TEST]${RESET} $desc"
    echo -e "${GREEN}Input:${RESET} \"$input\""
    echo -e "${GREEN}Command:${RESET} echo \"$input\" | ./game_of_life $args | cat -e"
    echo -e "${GREEN}Output:${RESET}"

    # Run with valgrind
    echo "$input" | valgrind -q ./game_of_life $args | cat -e

    # Check valgrind return status
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[Valgrind] No leaks detected${RESET}"
    else
        echo -e "${RED}[Valgrind] Possible leaks or errors${RESET}"
    fi
}

# 1. Invalid commands
run_test "invalid commands ignored" "zzzzdxss" "3 3 1"

# 2. Pen never down
run_test "pen never down" "ddddsssaaaaww" "5 5 0"

# 2b. Pen toggle multiple times
run_test "pen toggle multiple times" "xdddxxsss" "5 5 0"

# 3. Move outside board
run_test "move outside board (stops at edge)" "xaaaaaaaa" "3 3 0"

# 4. Block still life (stable 2x2 square)
run_test "block still life" "xddssaa" "4 4 3"

# 4b. Blinker oscillator
run_test "blinker oscillator" "xdsdssd" "5 5 2"

# 5. Board minimum sizes
run_test "1x1 board with one cell" "x" "1 1 2"
run_test "2x2 board small oscillations" "xds" "2 2 2"

# 6. Empty input
run_test "empty input" "" "5 5 1"

# 7. Snake path drawing
run_test "snake path drawing" "xdddsssaaaawwddss" "7 7 0"
