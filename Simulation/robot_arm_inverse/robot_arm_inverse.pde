/*
  Author: Xiaotian Dai
  Date: April 2021
  Credit: this project is based on an inverse kinematics demo by Diego Pontones (www.maquinapensante.com).
*/

int nLinks = 3;
int nGripperAngles = 5;
int GripperAngle[] = {0, -45, -90, 45, 90};
int linkStrokeW[] = {28, 18, 12};
int linkColor[] = {#00D000, #0000FF, #FF0000};
int l[] = {0, 100, 100, 60};
int h0 = 180; // Arm Origen in Screen Coordinates
int v0 = 360; // Arm Origen in Screen Coordinates
int currGripper = 0;

float[] w = new float[nLinks]; // horizontal coordinate, corresponds to P0, P1, P2 etc
float[] z = new float[nLinks]; // vertical coordinate
float[] a = new float[nLinks]; // angle for the link, reference is previous link
float tw, tz;   // target coordinate for the actuator (gripper)
float tw0, tz0; // Previous target coordinate for the actuator (gripper) that was inside the robot reach
float l12;
float a12;




void setup() {
  size(480, 560); //drawing window size
  smooth(); 
  w[0] = 0;  // Set Origen
  z[0] = 0;  // Set Origen
  tw0=100; // Initiakl Target
  tz0=100;
}

void draw() {
  background(240);
  checkMouseInMenu(mouseX, mouseY);
  drawGripperMenu();
  drawAxes();
  tw = mouseX - h0;
  tz = v0 - mouseY ;
  calcP2();
  if (l12 > l[1]+l[2]) {
    textAlign(CENTER); 
    fill(#FF0000);
    text("No Solution \n Move mouse pointer towards the origin.", 240, 80);
    tw=tw0;
    tz=tz0;
    calcP2();
  }
    calcP1();
    drawLinks();
    tw0=tw;
    tz0=tz;
}

void drawAxes(){
  strokeWeight(1);
  stroke(0);
  line(h0, v0, h0+259,v0);
  line(h0, v0, h0,v0-259);
}





/* GUI related functions */
void checkMouseInMenu(float hin, float vin){
  int H = 120;
  if((vin>436) && (vin<454)) { 
      for(int i=0; i<nGripperAngles; i++) {  
        if((hin>H-20) && (hin<H+20)) {
          currGripper=i;
        }
      H=H+44;  
    }
  }
}

void drawGripperMenu() {
  textAlign(CENTER);
  // text("Robot Arm Inverse Kinematics Algorithm Simulation", 250, 34);

  int H = 60;
  int V = 424;
  fill(0);
  textAlign(LEFT);  
  text("To change gripper angle roll mouse over new value",H,V);
  textAlign(CENTER);
  H = 120;
  V = 450;
  for(int i=0; i<nGripperAngles; i++) {  
    if(i == currGripper) {
      fill(0);
    }else {
      fill(180);  
    }
    text(GripperAngle[i], H, V);
    H = H+44;  
  }
}

/* inverse kinematics */
void calcP2(){
  w[2]=tw-cos(radians(GripperAngle[currGripper]))*l[3];
  z[2]=tz-sin(radians(GripperAngle[currGripper]))*l[3];
  l12 = sqrt(sq(w[2])+sq(z[2]));
}

void calcP1(){
  a12=atan2(z[2],w[2]);
  a[1]=acos((sq(l[1])+sq(l12)-sq(l[2]))/(2*l[1]*l12))+a12;
  w[1]=cos(a[1])*l[1];
  z[1]=sin(a[1])*l[1];
}

void drawLinks(){
  for (int i=0; i<2; i++) {  
    strokeWeight(linkStrokeW[i]);
    stroke(linkColor[i]);
    line(h0+w[i], v0-z[i], h0+w[i+1], v0-z[i+1]);
  }
  strokeWeight(linkStrokeW[2]);
  stroke(linkColor[2]);
  line(h0+w[2], v0-z[2], h0+tw, v0-tz);
  fill(0);
  strokeWeight(0);
  stroke(0);
  ellipse(h0+ tw,v0- tz,10,10);
}
