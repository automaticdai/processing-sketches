PImage cat;

void setup() {
  size(800, 600, P2D);
  cat = loadImage("cat.jpg");
}

void draw() {
  
  background(255);
  
  beginShape();
  texture(cat);
  textureMode(NORMAL);
  float xrnd = random(-3,3);
  float yrnd = random(-3,3);
  vertex(200 + xrnd, 200 + yrnd, 0, 0);
  vertex(400, 200, 1, 0);
  vertex(400 + xrnd, 300 + yrnd, 1, 1);
  vertex(200, 300, 0, 1);
  endShape(CLOSE);

}