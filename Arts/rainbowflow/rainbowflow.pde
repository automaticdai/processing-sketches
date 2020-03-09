
object[] sand = new object[1000];
PImage sprite; 

void setup() {
  size(1020, 300, P2D);
  background(0);
  sprite = loadImage("sprite.png");
  
  for ( int i = 0; i < sand.length; i++) {
    sand[i] = new object();
  }
}

void draw() {
  background(20);
  translate(width/2, height/2);
  for ( int i = 0; i < sand.length; i++) {
      sand[i].update();
      sand[i].show();
  }

}