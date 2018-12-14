PFont font;

int cellSize = 8;

float rndProb = 0.3;

Grid grid;

int running, menu;

color bg;
color border;
color element;

void setup() {
    size(800,800);
    background(bg);
    stroke(border);

    frameRate(8);

    bg  = color(33);
    border = color(85,98,112);
    element = color(252,251,227);

    running = 0;
    menu = 1;

    grid = new Grid(height/cellSize, width/cellSize, cellSize);

    noSmooth();
}

void draw() {
    if(menu == 1)
        showMenu();
    else if(running == 1)
            grid.epoch();
}

