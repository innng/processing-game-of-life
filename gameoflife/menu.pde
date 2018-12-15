void showMenu() {
    background(bg);
    fill(element);

    textAlign(CENTER);
    font = createFont("PressStart2P.ttf", 30);
    textFont(font);
    text("CONWAY'S GAME OF LIFE", width/2, 40);

    font = createFont("PressStart2P.ttf", 25);
    textFont(font);
    text("key sheets", width/2, 100);

    textAlign(LEFT);
    font = createFont("PressStart2P.ttf", 20);
    textFont(font);
    text("h - help", 10, 200);
    text("q - quit", 10, 230);
    text("c - clean start", 10, 260);
    text("s - random start", 10, 290);

    text("space - start/pause", width/2, 200);
    text("mouse click -", width/2, 230);
    text("change cell state", width/2, 260);

    textAlign(CENTER);
    text("colors", width/2, 350);

    textAlign(LEFT);
    text("1 - red", 10, 380);
    text("2 - blue", 10, 410);
    text("3 - green", 10, 440);
    text("4 - pink", 10, 470);
    text("5 - yellow", 10, 500);

    text("6 - orange", width/2, 380);
    text("7 - purple", width/2, 410);
    text("8 - gray", width/2, 440);
    text("9 - carnival", width/2, 470);
    text("0 - raibow", width/2, 500);
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
        grid.initGrid();
        grid.fillGrid();
        running = 0;
    }
    else if(key == 's') {
        if(menu == 1)
            menu = 0;
        grid.initGrid();
        grid.initRandom();
        grid.fillGrid();
        running = 1;
    }
    // 0 - raibow
    else if(keyCode == 48 && running == 1) {
        if(carnival == 1)
            carnival = 0;

        rainbow = 1;
    }
    // 1 - red
    else if(keyCode == 49 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[1];
    }
    // 2 - blue
    else if(keyCode == 50 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[2];
    }
    // 3 - green
    else if(keyCode == 51 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[3];
    }
    // 4 - pink
    else if(keyCode == 52 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[4];
    }
    // 5 - yellow
    else if(keyCode == 53 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[5];
    }
    // 6 - orange
    else if(keyCode == 54 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[6];
    }
    // 7 - purple
    else if(keyCode == 55 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[7];
    }
    // 8 - gray
    else if(keyCode == 56 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[8];
    }
    // 9 - carnival
    else if(keyCode == 57 && running == 1) {
        if(rainbow == 1)
            rainbow = 0;

        carnival = 1;
    }
}

void mouseClicked() {
    if(running == 0 && menu == 0) {
        int row = mouseX/cellSize;
        int col = mouseY/cellSize;


        if(grid.cells[col][row].state == 1) {
            grid.cells[col][row].state = 0;
            grid.cells[col][row].newState = 0;
        }
        else {
            grid.cells[col][row].state = 1;
            grid.cells[col][row].newState = 1;
        }

        grid.cells[col][row].show();
    }
}
