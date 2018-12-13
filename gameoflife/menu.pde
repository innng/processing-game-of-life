void showMenu() {
    background(bg);
    fill(252,251,227);

    // title
    textAlign(CENTER);
    font = createFont("PressStart2P.ttf", 30);
    textFont(font);
    text("CONWAY'S GAME OF LIFE", width/2, 40);

    // options
    textAlign(LEFT);
    font = createFont("PressStart2P.ttf", 20);
    textFont(font);
    text("h - help", 10, 100);
    text("q - quit", 10, 130);
    text("c - clean start", 10, 160);
    text("s - random start", 10, 190);
    text("space - start/pause", 10, 220);

    text("r - red", width/2 + 10, 100);
    text("b - blue", width/2 + 10, 130);
    text("g - green", width/2 + 10, 160);
    text("1~16 - patterns", width/2 + 10, 190);
    text("mouse click -", width/2 + 10, 220);
    text("change cell state", width/2 + 10, 250);

    // // patterns
    textAlign(CENTER);
    font = createFont("PressStart2P.ttf", 20);
    textFont(font);
    text("pre-made patterns", width/2, 350);

    textAlign(LEFT);
    font = createFont("PressStart2P.ttf", 15);
    textFont(font);
    text("still lifes", 10, 380);
    text("1 - block", 10, 410);
    text("2 - beehive", 10, 440);
    text("3 - loaf", 10, 470);
    text("4 - boat", 10, 500);
    text("5 - tub", 10, 530);

    text("oscillators", width/3 + 10, 380);
    text("6 - blinker", width/3 + 10, 410);
    text("7 - toad", width/3 + 10, 440);
    text("8 - beacon", width/3 + 10, 470);
    text("9 - pulsar", width/3 + 10, 500);
    text("10 - pentadecathlon", width/3 + 10, 530);

    text("spaceships", 2*width/3 + 10, 380);
    text("11 - glider", 2*width/3 + 10, 410);
    text("12 - lightweight", 2*width/3 + 10, 440);

    textAlign(CENTER);
    text("others", width/2, 600);
    text("13 - gosper glider gun", width/2, 630);
    text("14 - infinite 1", width/2, 660);
    text("15 - infinite 2", width/2, 690);
    text("16 - infinite 3", width/2, 720);
}

void keyPressed() {
    if(key == 'h' && menu == 0)
        menu = 1;
    else if(key == 'h' && menu == 1)
        menu = 0;
    else if(key == 'q')
        exit();
    else if(key == ' ' && running == 0)
        running = 1;
    else if(key == ' ' && running == 1)
        running = 0;
    else if(key == 'c') {
        if(menu == 1)
            menu = 0;
        initGrid();
        killAll();
        fillGrid();
        running = 0;
    }
    else if(key == 's') {
        if(menu == 1)
            menu = 0;
        initGrid();
        initRandom();
        fillGrid();
        running = 1;
    }
    else if(key == 'r')
        element = color(164,8,2);
    else if(key == 'g')
        element = color(144,171,118);
    else if(key == 'b')
        element = color(11,140,143);
}

void mouseClicked() {
    if(running == 0 || paused == 1) {
        int row = mouseX/cellSize;
        int col = mouseY/cellSize;


        if(grid[col][row].state == 1)
            grid[col][row].state = 0;
        else
            grid[col][row].state = 1;

        grid[col][row].show();

    }
}
