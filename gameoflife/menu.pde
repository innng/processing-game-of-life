// cria e desenha o menu do programa
void showMenu() {
    background(bg);
    fill(element);

    // título
    textAlign(CENTER);
    font = createFont("PressStart2P.ttf", 30);
    textFont(font);
    text("CONWAY'S GAME OF LIFE", width/2, 40);

    // subtítulo
    textFont(font, 25);
    text("key sheets", width/2, 100);

    // coluna mais à esquerda 1
    textAlign(LEFT);
    textFont(font, 20);
    text("h - help", 10, 200);
    text("q - quit", 10, 230);
    text("c - clean start", 10, 260);
    text("s - random start", 10, 290);

    // coluna mais à direita 1
    text("space - start/pause", width/2, 200);
    text("mouse click -", width/2, 230);
    text("change cell state", width/2, 260);

    // subtítulo 2
    textAlign(CENTER);
    text("colors", width/2, 350);

    // coluna mais à esquerda 2
    textAlign(LEFT);
    text("1 - red", 10, 380);
    text("2 - blue", 10, 410);
    text("3 - green", 10, 440);
    text("4 - pink", 10, 470);
    text("5 - yellow", 10, 500);

    // coluna mais à direita 2
    text("6 - orange", width/2, 380);
    text("7 - purple", width/2, 410);
    text("8 - gray", width/2, 440);
    text("9 - carnival", width/2, 470);
    text("0 - rainbow", width/2, 500);
}

// função que define ação a ser tomada caso uma tecla seja pressionada
void keyPressed() {
    // tecla h - ajuda (com menu fechado)
    if(key == 'h' && menu == 0)
        menu = 1;
        // tecla h - ajuda (com menu aberto)
    else if(key == 'h' && menu == 1)
        menu = 0;
    // tecla q - sair
    else if(key == 'q')
        exit();
    // tecla espaço - início/pause (com programa não executando)
    else if(key == ' ' && running == 0)
        running = 1;
    // tecla espaço - início/pause (com programa executando)
    else if(key == ' ' && running == 1)
        running = 0;
    // tecla c - inicia o grid vazio
    else if(key == 'c') {
        // se menu estiver aberto, fecha
        if(menu == 1)
            menu = 0;
        grid.initGrid();
        grid.fillGrid();
        // não põe para rodar (deve ser feito manualmente com pause)
        running = 0;
    }
    // tecla s - início aleatório
    else if(key == 's') {
        // se menu estiver aberto, fecha
        if(menu == 1)
            menu = 0;
        grid.initGrid();
        grid.initRandom();
        grid.fillGrid();
        running = 1;
    }
    // tecla 0 - modo arco-íris
    else if(keyCode == 48 && running == 1) {
        if(carnival == 1)
            carnival = 0;

        rainbow = 1;
    }
    // tecla 1 - vermelho
    else if(keyCode == 49 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[1];
    }
    // tecla 2 - azul
    else if(keyCode == 50 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[2];
    }
    // tecla 3 - verde
    else if(keyCode == 51 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[3];
    }
    // tecla 4 - rosa
    else if(keyCode == 52 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[4];
    }
    // tecla 5 - amarelo
    else if(keyCode == 53 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[5];
    }
    // tecla 6 - laranja
    else if(keyCode == 54 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[6];
    }
    // tecla 7 - roxo
    else if(keyCode == 55 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[7];
    }
    // tecla 8 - cinza
    else if(keyCode == 56 && running == 1) {
        if(rainbow == 1 || carnival == 1) {
            carnival = 0;
            rainbow = 0;
        }

        element = colors[8];
    }
    // tecla 9 - modo carnival
    else if(keyCode == 57 && running == 1) {
        if(rainbow == 1)
            rainbow = 0;

        carnival = 1;
    }
}

// função que define ação a ser tomada caso haja clique do mouse
void mouseClicked() {
    // se não está executando e menu não está aberto, pode-se alterar o estado
    // das células
    if(running == 0 && menu == 0) {
        int row = mouseX/cellSize;
        int col = mouseY/cellSize;

        // altera estado atual (para se desenhada no grid) e próximo estado (para se incluída no algoritmo)
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
