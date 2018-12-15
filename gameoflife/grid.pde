class Grid {
    int cellSize;
    int row, col;
    Cell[][] cells;

    Grid(int r, int c, int sz) {
        this.row = r;
        this.col = c;
        this.cellSize = sz;

        this.cells = new Cell[this.col][this.row];
    }

    void showGrid() {
        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                fill(bg);
                rect(r*this.cellSize, c*this.cellSize, this.cellSize, this.cellSize);
            }
        }
    }

    void initGrid() {
        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                this.cells[c][r] = new Cell(r, c, this.cellSize);
            }
        }
    }

    void fillGrid() {
        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                this.cells[c][r].show();
            }
        }
    }

    void initRandom() {
        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                this.cells[c][r].randomState();
            }
        }
    }

    void epoch() {
        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                this.cells[c][r].changeState();
            }
        }

        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                this.cells[c][r].setState();
            }
        }

        if(rainbow == 1)
            rainbow();
        else if(carnival == 1)
            carnival();
        else
            fillGrid();

    }

    void rainbow() {
        colorMode(HSB, 100);

        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                int i = c;
                if(i > 255)
                    i = 0;
                element = color(c, 255,255);

                this.cells[c][r].show();
            }
        }
        colorMode(RGB, 100);
    }

    void carnival() {
        colorMode(HSB, 100);

        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                float rnd = random(1);
                if(rnd < 0.5)
                    element = color(c, 255,255);
                else
                    element = color(r, 255,255);

                this.cells[c][r].show();
            }
        }
        colorMode(RGB, 100);
    }
}


