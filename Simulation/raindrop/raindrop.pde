drop[] d;

void setup(){
  frameRate(60);
  size(600,400);
  //fullScreen();
  //smooth(4);
  
  d = new drop[800];
  for (int i = 0; i < d.length; i++) {
    d[i] = new drop();
  }
} 

void draw() {
  background(240, 240, 240);
  for (int i = 0; i < d.length; i++){
    d[i].update();
    d[i].show();    
  }

}
