Star[] stars;

void setup() {

  fullScreen();
  stars = new Star[200];
  
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  
}



void draw() {
  background(0);
  
  translate(width/2, height/2);
  
  for (int i = 0; i < stars.length; i++) {
    Star s = stars[i];
    s.update();
    s.show();
  }  
}