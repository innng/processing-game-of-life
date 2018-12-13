//font used in menu
PFont font;

// size of one cell in the grid
int cellSize = 6;
// maximum of rows and columns a grid can have
int maxRow, maxCol;

// probability for initial-state start
float rndProb = 0.3;

// grid itself (matrix of cells)
Cell[][] grid;

// flags
int running, menu, paused;

// basic colors
color bg;
color border;
color element;

void setup() {
    size(800,800);
    background(bg);
    stroke(border);

    frameRate(8);

    maxRow = height/cellSize;
    maxCol = width/cellSize;

    grid = new Cell[maxCol][maxRow];

    bg  = color(33);
    border = color(85,98,112);
    element = color(252,251,227);

    running = 0;
    menu = 1;
    paused = 0;

    noSmooth();
}

void draw() {
    if(menu == 1)
        showMenu();
    else if(running == 1)
        epoch();
}

