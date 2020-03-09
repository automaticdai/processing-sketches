
void draw_spiral(float r_start, float r_end, float angle_start) {
  float r = r_start;
  float angle = angle_start;
  
  pushStyle();

  noFill();
  strokeWeight(15);
  
  beginShape();
  while(true) {
    vertex(r*cos(angle) + width /2, height/2 - r*sin(angle));
    r += 0.5;
    angle += 0.1;
    if (r > r_end) {
      break;
    }
  }
  endShape();
  
  popStyle();
  
}


void settings() {
  //fullScreen();
  size(400, 400);
}


void setup() {
  smooth();
  frameRate(60);
}

float degree = 0;
void draw() {
  background(255);
  draw_spiral(10, width + 10, radians(degree));
  degree += 10;
}
