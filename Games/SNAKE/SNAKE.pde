// SNAKE Ver 0.1
// Apr,2013
// By YunFei

CSnake  snake;
CGui    gui;
int		keyPressedByUser;

void setup() {
	size(800, 600);
	background(255);
	strokeWeight(1);
	frameRate(15);
	
	snake = new CSnake();
	gui = new CGui(width, height, 30);
}

void draw() {
	background(255);
	
	gui.showGrid();
	gui.showDashboard();
	gui.showSnake(snake);
	
	keyPressedByUser = gui.getKeyPressed();
	if ( keyPressedByUser != 0 ) {
		snake.move(keyPressedByUser);
	}
	
}


