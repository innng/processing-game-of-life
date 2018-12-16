// classe que define uma célula
class Cell {
	// state: estado atual da céluda (morta ou viva)
	// newState: estado da célula na próxima iteração (morta ou viva)
	int state, newState;
	// row: linha em que a célula se encontra
	// col: coluna em que a célula se encontra
	int row, col;
	// xPos: posição no eixo x absoluta da célula
	// yPos: posição no eixo y absoluta da célula
	int xPos, yPos;
	// neighbors: número de vizinhos vivos em dado momento
	int neighbors;

	Cell(int r, int c) {
		this.row = r;
		this.col = c;

		this.state = 0;
		this.newState = 0;
		this.neighbors = 0;
		this.xPos = this.row * cellSize;
		this.yPos = this.col * cellSize;
	}

	// desenha a célula na tela
	void show() {
		if(this.state == 1)
			fill(element);
		else
			fill(bg);

		rect(this.xPos, this.yPos, cellSize, cellSize);
	}

	// define estado aleatório inicial para célula
	void randomState() {
		float rnd = random(1);

		if(rnd < rndProb)
			this.state = 1;
		else
			this.state = 0;
	}

	// conta quantos vizinhos vivos a célula possui
	void countNeighbors() {
		// limite para linha e para coluna
		int limRow, limCol;
		// reseta número de vizinhos vivos
		this.neighbors = 0;

		// top
		limRow = this.row - 1;
		if(limRow > -1 && grid.cells[this.col][limRow].state == 1)
			this.neighbors++;
		// bottom
		limRow = this.row + 1;
		if(limRow < grid.row && grid.cells[this.col][limRow].state == 1)
			this.neighbors++;
		// left
		limCol = this.col - 1;
		if(limCol > -1 && grid.cells[limCol][this.row].state == 1)
			this.neighbors++;
		// right
		limCol = this.col + 1;
		if(limCol < grid.col && grid.cells[limCol][this.row].state == 1)
			this.neighbors++;

		// top-left
		limRow = this.row - 1;
		limCol = this.col - 1;
		if(limRow > -1 && limCol > -1 && grid.cells[limCol][limRow].state == 1)
			this.neighbors++;
		// top-right
		limRow = this.row - 1;
		limCol = this.col + 1;
		if(limRow > -1 && limCol < grid.col && grid.cells[limCol][limRow].state == 1)
			this.neighbors++;
		// bottom-left
		limRow = this.row + 1;
		limCol = this.col - 1;
		if(limRow < grid.row && limCol > -1 && grid.cells[limCol][limRow].state == 1)
			this.neighbors++;
		// bottom-right
		limRow = this.row + 1;
		limCol = this.col + 1;
		if(limRow < grid.row && limCol < grid.col && grid.cells[limCol][limRow].state == 1)
			this.neighbors++;
	}

	// altera o estado da célula baseado na quantidade de vizinhos
	void changeState() {
		this.countNeighbors();

		// testa alteração de estado para célula viva
		if(this.state == 1) {
			if(this.neighbors < 2 || this.neighbors > 3)
				this.newState = 0;
			if(this.neighbors == 2 && this.neighbors == 3)
				this.newState = 1;
		}
		// testa alteração de estado para célula morta
		else if(this.state == 0)
			if(this.neighbors == 3)
				this.newState = 1;
			else
				this.newState = 0;
	}

	// faz a passagem do próximo estado como estado atual
	void setState() {
		this.state = this.newState;
	}
}
