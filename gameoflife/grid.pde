// classe para definir objeto grid
class Grid {
    // row: quantidade máxima de linhas possível
    // col: quantidade máxima de colunas possível
    int row, col;
    // matriz de células que compõe o grid
    Cell[][] cells;

    Grid(int r, int c) {
        this.row = r;
        this.col = c;

        this.cells = new Cell[this.col][this.row];
    }

    // desenha o grid vazio
    void showGrid() {
        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                fill(bg);
                rect(r*cellSize, c*cellSize, cellSize, cellSize);
            }
        }
    }

    // inicializa todas as células do grid
    void initGrid() {
        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                this.cells[c][r] = new Cell(r, c);
            }
        }
    }

    // desenha todas as células do grid
    void fillGrid() {
        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                this.cells[c][r].show();
            }
        }
    }

    // inicializa o grid aleatoriamente
    void initRandom() {
        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                this.cells[c][r].randomState();
            }
        }
    }

    // função que intera uma época completa
    void epoch() {
        // define próximo estado de cada célula
        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                this.cells[c][r].changeState();
            }
        }

        // seta novos estados
        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                this.cells[c][r].setState();
            }
        }

        // define qual cor será usada baseada no modo ativo
        if(rainbow == 1)
            rainbow();
        else if(carnival == 1)
            carnival();
        else
            fillGrid();
    }

    // cria o efeito arco-íris no grid
    void rainbow() {
        // muda o modo de coloração
        colorMode(HSB, 100);

        // define a cor da célula baseada na coluna em que ela se encontra
        for(int c = 0; c < this.col; c++) {
            for(int r = 0; r < this.row; r++) {
                int i = c;
                if(i > 255)
                    i = 0;
                element = color(c, 255,255);

                // desenha a célula
                this.cells[c][r].show();
            }
        }
        // volta o estado de cores padrão
        colorMode(RGB, 100);
    }

    // cria o efeito colorido no grid
    void carnival() {
        // muda o modo de coloração
        colorMode(HSB, 100);

        // escolhe um valor aleatório e baseado nisso define se a cor estará em
        // função da coluna ou da linha as quais a célula pertence
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
        // volta o estado de cores padrão
        colorMode(RGB, 100);
    }
}


