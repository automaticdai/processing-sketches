Star[] stars;
float x = 0;

void setup() {

  fullScreen(P2D);
  noCursor();
  
  stars = new Star[200];
  
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0,0,10 + 10 * sin(x)); // add sin(x) for breathing efforts
  x = x + 0.01;
  translate(width/2, height/2);
  
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }  
}
