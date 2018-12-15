PFont font;

int cellSize = 8;

float rndProb = 0.3;

Grid grid;

int running, menu, rainbow, carnival;

color[] colors;
color bg;
color border;
color element;

void setup() {
    size(800,800);
    background(bg);
    stroke(border);

    frameRate(8);

    colors = new color[9];
    colors[0] = color(252,251,227);
    colors[1] = color(164,8,2);
    colors[2] = color(22,147,165);
    colors[3] = color(127,175,27);
    colors[4] = color(254,67,101);
    colors[5] = color(251,184,41);
    colors[6] = color(255,102,0);
    colors[7] = color(175,63,198);
    colors[8] = color(85,98,112);

    bg  = color(33);
    border = color(85,98,112);
    element = colors[0];

    running = 0;
    menu = 1;
    rainbow = 0;
    carnival = 0;

    grid = new Grid(height/cellSize, width/cellSize, cellSize);

    noSmooth();
}

void draw() {
    if(menu == 1)
        showMenu();
    else if(running == 1)
            grid.epoch();
}

