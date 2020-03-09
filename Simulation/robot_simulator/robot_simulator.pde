
void setup() {
  size(640, 480, P3D);
  noSmooth();
  background(0);
}

int joint_width = 15;
int joint1_len = 150;
int joint2_len = 100;
int joint3_len = 80;
float alpha = -90;
float beta = -50;
float gamma = -20;

int dir = 0;

void draw() {
  background(255);
  noStroke();
  fill(100);
  
  translate(400,480);
  rotate(radians(alpha));
  rect(0, -joint_width/2, joint1_len, joint_width);
  sphere(joint_width);
  
  translate(joint1_len, 0);
  rotate(radians(beta));
  rect(0, -joint_width/2, joint2_len, joint_width);
  sphere(joint_width);
  
  translate(joint2_len, 0);
  rotate(radians(gamma));
  rect(0, -joint_width/2, joint3_len, joint_width);
  sphere(joint_width);

  translate(joint3_len, 0);
  sphere(joint_width);
  
  if (dir == 0) {
    beta -= 0.5;
    gamma -= 1;
  } 
  else {
    beta += 1;
    gamma += 2;
  }
  
  if ( beta <= -90 ) {
    dir = 1;
  }
  else if ( beta >= -45 ) {
    dir = 0;
  }
}