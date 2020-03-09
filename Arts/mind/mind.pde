
int number = 800;

branch[] t = new branch[number];

void setup() {
  float ang = 0;
  float ang_d = PI * 2 / number;
  
  size(800, 600);
  background(255);
  
  for (int i = 0; i < number; i++ ) {
    t[i] = new branch(cos(ang),sin(ang));
    ang += ang_d;  
  }
}

void draw() {
  translate(width/2,height/2);
  for (int i = 0; i < number; i++ )
  {
    t[i].refresh();  
  }
}
