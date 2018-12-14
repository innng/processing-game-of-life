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

    void killAll() {
        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                this.cells[c][r].state = 0;
                this.cells[c][r].neighbors = 0;
            }
        }
    }

    int allDead() {
        int allDead = 1;

        for(int c = 0; c < this.col; c++)
            for(int r = 0; r < this.row; r++)
                if(this.cells[c][r].state == 1) {
                    allDead = 0;
                    return allDead;
                }

        return allDead;
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

        fillGrid();
    }
}


