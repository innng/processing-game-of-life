void showGrid() {
    for(int c = 0; c < maxCol; c++) {
        for(int r = 0; r < maxRow; r++) {
            noFill();
            rect(r*cellSize, c*cellSize, cellSize, cellSize);
        }
    }
}

void initGrid() {
    for(int c = 0; c < maxCol; c++) {
        for(int r = 0; r < maxRow; r++) {
            grid[c][r] = new Cell(r, c);
        }
    }
}

void fillGrid() {
    for(int c = 0; c < maxCol; c++) {
        for(int r = 0; r < maxRow; r++) {
            grid[c][r].show();
        }
    }
}

void initRandom() {
    for(int c = 0; c < maxCol; c++) {
        for(int r = 0; r < maxRow; r++) {
            grid[c][r].randomState();
        }
    }
}

void killAll() {
    for(int c = 0; c < maxCol; c++) {
        for(int r = 0; r < maxRow; r++) {
            grid[c][r].state = 0;
            grid[c][r].neighbors = 0;
        }
    }
}

void epoch() {
    fillGrid();

    for(int c = 0; c < maxCol; c++) {
        for(int r = 0; r < maxRow; r++) {
            grid[c][r].changeState();
        }
    }

    for(int c = 0; c < maxCol; c++) {
        for(int r = 0; r < maxRow; r++) {
            grid[c][r].setState();
        }
    }
}
