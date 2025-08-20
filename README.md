# Mandarin Square Capturing Game

A MATLAB implementation of the traditional Mandarin Square Capturing game (also known as O An Quan), featuring both single-player (vs computer) and two-player modes with an interactive graphical interface.

## Table of Contents
- [Game Description](#game-description)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [How to Play](#how-to-play)
- [Game Rules](#game-rules)
- [File Structure](#file-structure)
- [Screenshots](#screenshots)
- [Contributing](#contributing)

## Game Description

Mandarin Square Capturing is a traditional Vietnamese board game played on a board with 12 squares arranged in a rectangle. Players distribute citizens (pieces) around the board and capture opponent's pieces by strategic moves. This MATLAB implementation brings the classic game to life with:

- Visual board representation with colored squares
- Interactive command-line gameplay
- Computer AI opponent
- Automatic score tracking
- Move validation and game state management

## Features

- **Two Game Modes:**
  - Single Player: Play against computer AI
  - Two Player: Play with a friend locally

- **Interactive Interface:**
  - Graphical board display with MATLAB figures
  - Command-line input for moves
  - Real-time score display
  - Visual feedback for moves and captures

- **Game Logic:**
  - Complete rule implementation
  - Automatic move validation
  - Capture detection and scoring
  - Win condition checking
  - Dispatching mechanism when sides are empty

## Requirements

- MATLAB R2016b or later
- No additional toolboxes required

## Installation

1. Clone or download this repository
2. Open MATLAB and navigate to the project directory
3. Run the main game file:
   ```matlab
   mandarinSquareCapturing
   ```

## How to Play

1. **Start the Game:** Run `mandarinSquareCapturing.m`
2. **Choose Game Mode:** 
   - Enter `1` for Player vs Computer
   - Enter `2` for Player vs Player
   - Enter `3` to quit
3. **Select Colors:** Choose red or blue pieces (computer takes the remaining color in single-player mode)
4. **Make Moves:** 
   - Enter the square name (e.g., 'b1', 'r3') containing citizens you want to move
   - Choose direction: 'left' or 'right'
5. **Follow the Game:** Watch as citizens are distributed and captures occur automatically

### Board Layout

```
[k1] [r5] [r4] [r3] [r2] [r1] [k2]
     [b1] [b2] [b3] [b4] [b5]
```

- **k1, k2:** Mandarin squares (black)
- **r1-r5:** Red player's squares
- **b1-b5:** Blue player's squares

## Game Rules

### Setup
- Each player starts with 5 citizens in each of their 5 squares
- Each Mandarin square starts with 10 citizens
- Total: 60 citizens on the board

### Gameplay
1. **Turn Structure:** Players alternate turns
2. **Move Selection:** Choose any non-empty square on your side
3. **Distribution:** Pick up all citizens from chosen square and distribute one citizen per square in the chosen direction
4. **Continuation:** After distribution, pick up citizens from the next square and continue in the same direction

### Capturing
- **Empty Square Rule:** If the next square to distribute is empty, capture all citizens from the square after it
- **Chain Capturing:** Continue capturing if subsequent squares follow the empty-full pattern
- **Mandarin Squares:** Special rules apply when distributing into Mandarin squares

### Winning Conditions
- **Most Citizens:** Player with the most captured citizens wins
- **Both Mandarins Captured:** Game ends immediately; remaining citizens belong to the controlling player

### Special Rules
- **Passing:** Turn ends if next square is a Mandarin square or if encountering two consecutive empty squares
- **Dispatching:** If a player's side is completely empty, they must use 5 captured citizens to refill their squares

## File Structure

```
Mandarin-Square-Capturing/
├── mandarinSquareCapturing.m    # Main game launcher
├── gameIntro.m                  # Game introduction display
├── gameMode.m                   # Game mode selection
├── gameInstruction.m            # Display game instructions
├── createBoard.m                # Board visualization
├── computerMode.m               # Single-player game logic
├── playerMode.m                 # Two-player game logic
├── computerBlueTurn.m           # Computer blue player logic
├── computerRedTurn.m            # Computer red player logic
├── playerBlueTurn.m             # Human blue player logic
├── playerRedTurn.m              # Human red player logic
├── getComputerBlueMove.m        # Computer blue move generation
├── getComputerRedMove.m         # Computer red move generation
├── getPlayerBlueMove.m          # Human blue move input
├── getPlayerRedMove.m           # Human red move input
├── computeMove.m                # Move calculation and execution
├── checkCapturing.m             # Capture logic
├── checkWinner.m                # Win condition checking
├── fillCitizen.m                # Board initialization
├── plotCitizen.m                # Display citizens on board
├── plotDirection.m              # Display move direction
├── restartCitizen.m             # Reset citizen positions
├── dispatching.m                # Handle dispatching mechanism
├── scoreBoard.m                 # Score display
├── instruction.txt              # Detailed game instructions
├── 1 player mode.txt           # Single-player rules
├── 2 player mode.txt           # Two-player rules
└── README.md                   # This file
```

## Screenshots

The game features:
- Clean graphical board with colored squares (red, blue, black)
- Real-time citizen count display
- Score tracking at the top of the screen
- Direction arrows showing move progression
- Command-line interface for move input

## Game Strategy Tips

- **Opening Moves:** Start with squares that give you the most distribution options
- **Capture Setup:** Look for opportunities to create empty squares before full ones
- **Mandarin Control:** Be cautious about moves that give opponents access to Mandarin squares
- **Endgame:** Focus on maximizing captures when few citizens remain

## Technical Implementation

- **Object-Oriented Design:** Modular functions for different game aspects
- **State Management:** Persistent game state throughout gameplay
- **AI Algorithm:** Computer opponent uses strategic move evaluation
- **Input Validation:** Robust error checking for user inputs
- **Visual Feedback:** Real-time board updates and move visualization

## Contributing

Feel free to contribute to this project by:
- Reporting bugs
- Suggesting new features
- Improving the AI algorithm
- Adding visual enhancements
- Optimizing code performance

## License

This project is created for educational purposes as part of MATLAB programming coursework.

## Acknowledgments

- Traditional Mandarin Square Capturing game rules
- MATLAB documentation and community
- Vietnamese cultural game heritage

---

**Enjoy playing Mandarin Square Capturing!** 🎮

For questions or issues, please refer to the instruction files or examine the source code comments for detailed implementation explanations.