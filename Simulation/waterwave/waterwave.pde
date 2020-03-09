int e,i;
float g, h,u;

int circles_num = 100;

float[] j = new float[circles_num];

void setup(){
  size(1024, 1024, P3D);
  g = TWO_PI / 200.0;
}

void draw(){
  h += 0.06; //0.16
  
  translate(width/2, height/2, -300);
  
  u = sin(h)*80;
  //u = (sin(h)*80 > 60) ? 60 : (sin(h)*80);
  //u = (u < -60) ? -60 : u;
  
  j[0] = u;
  
  for (i = circles_num - 1; i > 0;i--){
    j[i] = j[i-1];
  }
  
  rotateZ(0);
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  rotateX(map(mouseY, 0, height, 0, TWO_PI));
  
  background(0);
  stroke(255);
  fill(25, 240, 200);
  
  translate(0, j[0], 0);
  sphere(10);
  translate(0, -j[0], 0);
  
  noFill();
  for(i = 0; i < circles_num; i++){
    colorMode(HSB, 360);
    stroke(map(j[i],-80,80,200,250), 300, 300);
    beginShape(); // define how many loops
    for(e = 0; e < 200; e++){
      point(cos(g*e)*i*10, j[i], sin(g*e)*i*10); // points per cycle
    }
    endShape();
  }
}