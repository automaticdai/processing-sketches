
Metaball[] balls;

void setup(){
  size(600, 600);
  
  balls = new Metaball[5];
  
  for (int i = 0; i < balls.length; i++) {
    PVector pos = new PVector(random(width), random(height));
    balls[i] = new Metaball(pos, PVector.random2D());
  }
  
  
  
}

void draw() {
  
  colorMode(HSB, 255, 255, 255);
  background(0, 0, 0);
  
  loadPixels();
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      PVector pos = new PVector(x, y);
      int index = x + y * width;
      float sum = 0;
      
      for (int i = 0; i < balls.length; i++) {
        float d = PVector.dist(balls[i].loc, pos);
        sum += 7000 * 1.0 / (d + 0.0001);   
      }
      
      pixels[index] = color(sum, 250, 250);
     
    }
  
  }
  updatePixels();
  
  for (int i = 0; i < balls.length; i++) {
    balls[i].update();
  }
}