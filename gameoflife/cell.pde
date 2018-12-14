class Cell {
	int state, newState;
	int row, col;
	int xPos, yPos;
	int size;
	int neighbors;

	Cell(int r, int c, int sz) {
		this.row = r;
		this.col = c;
		this.size = sz;

		this.state = 0;
		this.newState = 0;
		this.neighbors = 0;
		this.xPos = this.row * this.size;
		this.yPos = this.col * this.size;
	}

	void show() {
		if(this.state == 1)
			fill(element);
		else
			fill(bg);

		rect(this.xPos, this.yPos, this.size, this.size);
	}

	void randomState() {
		float rnd = random(1);

		if(rnd < rndProb)
			this.state = 1;
		else
			this.state = 0;
	}

	void countNeighbors() {
		int limRow, limCol;
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

	void changeState() {
		this.countNeighbors();

		if(this.state == 1) {
			if(this.neighbors < 2 || this.neighbors > 3)
				this.newState = 0;
			if(this.neighbors == 2 && this.neighbors == 3)
				this.newState = 1;
		}
		else if(this.state == 0)
			if(this.neighbors == 3)
				this.newState = 1;
			else
				this.newState = 0;
	}

	void setState() {
		this.state = this.newState;
	}
}
