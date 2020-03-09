int scl = 20;
float seed = 0;
int rows, cols;

float flying = 0;

float[][] terrain;


void setup(){
  size(1200, 800, P3D);
  rows = height / scl;
  cols = width / scl;
  terrain = new float[cols][rows];
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      terrain[i][j] = random(-10,10);
    }
  }
  frameRate(60);
}

void draw() {
  background(0);
  noFill();
  stroke(255);
  
  translate(width/2, height/2);
  rotateX(PI/4);
  
  translate(-width/2, -height/2);
  flying -= 0.1;
  float yoff = flying;
  for (int j = 0; j < rows; j++) {
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      terrain[i][j] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  seed = seed + (rows / 10.0);
  
  for (int j = 0; j < rows - 1; j++) {
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < cols; i++) {
      vertex(i * scl, j * scl, terrain[i][j]);
      vertex(i * scl, (j + 1)* scl, terrain[i][j+1]);
    }
    endShape();
  }
  
}
