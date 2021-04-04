// Recursive Tree
// YunFei
void setup() {
  size(500, 500);
  
  background(255);
  translate(width/2, height);
  stroke(0);
  drawBranch(150);
}
 

void draw() {
  ;
}


void mouseClicked() {
  background(255);
  translate(width/2, height);
  stroke(0);
  drawBranch(150);
}


void drawBranch(float len) {
  float theta = map(random(1), 0, 1, PI/12, PI/6);
  len = len * random(0.5, 1.2);
  strokeWeight(2);
  line(0, 0, 0, -len);
 
  translate(0, -len);
  len *= 0.66; 
  
  if (len > 10) {
    pushMatrix();
    rotate(theta);
    drawBranch(len);
    popMatrix();    
 
    pushMatrix();
    rotate(-theta);
    drawBranch(len);
    popMatrix();
  }
}