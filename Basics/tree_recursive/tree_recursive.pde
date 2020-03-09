// Recursive Tree
// YunFei
void setup() {
  size(500, 500);
}
 
int n = 0; // n is for displaying branch number

void draw() {
  //background(255);
  //drawBranch(150);
  background(255);
  translate(width/2, height);
  stroke(0);
  drawBranch(150);
  //n = 0;
}
 
void drawBranch(float len) {
  float theta = map(mouseX, 0, width, 0, PI/6);
 
  strokeWeight(2);
  line(0, 0, 0, -len);
 
  translate(0, -len);
  fill(0, 102, 153);
  //text(n,0,0);
  //n++;
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