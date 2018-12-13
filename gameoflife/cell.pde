class Cell {
	int state, newState;
	int row, col;
	int xPos, yPos;
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

	void show() {
		if(this.state == 1)
			fill(element);
		else
			fill(bg);

		rect(this.xPos, this.yPos, cellSize, cellSize);
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
		if(limRow > -1 && grid[this.col][limRow].state == 1)
			this.neighbors++;
		// bottom
		limRow = this.row + 1;
		if(limRow < maxRow && grid[this.col][limRow].state == 1)
			this.neighbors++;
		// left
		limCol = this.col - 1;
		if(limCol > -1 && grid[limCol][this.row].state == 1)
			this.neighbors++;
		// right
		limCol = this.col + 1;
		if(limCol < maxCol && grid[limCol][this.row].state == 1)
			this.neighbors++;

		// top-left
		limRow = this.row - 1;
		limCol = this.col - 1;
		if(limRow > -1 && limCol > -1 && grid[limCol][limRow].state == 1)
			this.neighbors++;
		// top-right
		limRow = this.row - 1;
		limCol = this.col + 1;
		if(limRow > -1 && limCol < maxCol && grid[limCol][limRow].state == 1)
			this.neighbors++;
		// bottom-left
		limRow = this.row + 1;
		limCol = this.col - 1;
		if(limRow < maxRow && limCol > -1 && grid[limCol][limRow].state == 1)
			this.neighbors++;
		// bottom-right
		limRow = this.row + 1;
		limCol = this.col + 1;
		if(limRow < maxRow && limCol < maxCol && grid[limCol][limRow].state == 1)
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
