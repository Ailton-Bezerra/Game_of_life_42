# Game of Life (Ecole 42 exam question)

This repository contains a C implementation of **Conway’s Game of Life** following the project restrictions (only the functions `atoi`, `read`, `putchar`, `malloc`, `calloc`, `realloc`, `free` are allowed).

---

## 📖 About the project

The program simulates the Game of Life on a 2D board, where each cell can be **alive** (`0`) or **dead** (space).  

The initial configuration is not given as coordinates, but is drawn by a **virtual pen** moving across the board according to commands received from **standard input**.

### Supported commands
- `w` → move pen **up**
- `a` → move pen **left**
- `s` → move pen **down**
- `d` → move pen **right**
- `x` → toggle the pen state (up/down).  
  - When the pen is down, every move marks cells as alive (`0`).

### Additional rules
- The pen never moves outside the board (if a move would go beyond the edge, it stays in place).
- Invalid commands are ignored.
- The initial drawing ends when the program reaches **EOF** on input.

---

## ⚙️ Game of Life rules

After the initial configuration, the program applies Conway’s rules:

1. A **live** cell (`0`) survives if it has **2 or 3 live neighbors**.  
2. A **dead** cell (space) becomes alive if it has **exactly 3 live neighbors**.  
3. All other cells die or remain dead.  
4. Cells outside the board are always considered **dead**.  

The number of iterations is defined as a command-line argument.

---

## ▶️ Compilation and execution

### Compilation
```bash
gcc -Wall -Wextra -Werror -o game_of_life *.c
```

### Run
```bash
./game_of_life width height iterations
```

#### Arguments:

- `width` → board width

- `height` → board height

- `iterations` → number of Game of Life iterations

The program reads the initial configuration from stdin.


#### 📝 Example
```bash
 echo 'dxss' | ./game_of_life 3 3 2 | cat -e
```

Output:
```bash
 0 $
 0 $
 0 $
```

