int scl = 20;
int rows, cols;

void setup(){
  size(500, 500);
  rows = width / scl;
  cols = height / scl;
}

void draw() {
  background(0);
  stroke(200, 10, 10);
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      rect(i * scl, j * scl, scl, scl);
    }
  }
}