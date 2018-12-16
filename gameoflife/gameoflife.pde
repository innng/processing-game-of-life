// objeto para usar fontes no menu
PFont font;

// tamanho da célula no grid
int cellSize = 8;

// probabilidade de uma célula estar viva aleatoriamente
float rndProb = 0.3;

// grid do programa
Grid grid;

// flags usadas para definir os estados usados no programa
// running: se programa está rodando
// menu: se menu está aberto
// rainbow: se programas utiliza o modo rainbow
// rainbow: se programas utiliza o modo carnival
int running, menu, rainbow, carnival;

// vetor de cores utilizadas
color[] colors;
// cor de fundo
color bg;
// cor para linhas de fronteira entre células no grid
color border;
// cor de todos os elementos em dado momento
color element;

void setup() {
    size(800,800);
    background(bg);
    stroke(border);

    frameRate(8);

    // definição das cores utilizadas
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
    // jogo começa na cor branca
    element = colors[0];

    running = 0;
    menu = 1;
    rainbow = 0;
    carnival = 0;

    // inicialização do grid
    grid = new Grid(height/cellSize, width/cellSize);

    noSmooth();
}

void draw() {
    // se menu não está ativo, começa iteração das épocas
    if(menu == 1)
        showMenu();
    else if(running == 1)
        grid.epoch();
}

