import processing.serial.*;

Serial myPort;
ArrayList obstatles;
PFont font;
String strDistance = "0 ";

void setup()
{
  size(1200, 300);

  myPort = new Serial(this, "COM2", 19200, 'N', 8, 1.0);
  myPort.clear();
  
  obstatles = new ArrayList();
  
  font = loadFont("SimHei-48.vlw");
  textFont(font);
}

void draw()
{
  
  int distance;
  
  background(255);
  noStroke();
  
  
  /* 等待串口数据返回 */
  while (myPort.available() > 0) {
    strDistance = myPort.readStringUntil(32);
    if (strDistance != null) {  
      println(strDistance);
      distance = strtoint(strDistance);
      obstatles.add(new Obstacle(distance));     
    }   
  }
  
  /* 显示距离 */
  fill(0);
  text(strDistance + "mm", 15, 60);
  
  /* 显示障碍物 */
  display_obstatles();

}


int strtoint(String str)
{
  int num = 0;
  
  for ( int i = 0; i < str.length()-1; i++ ){
    num = num*10 + (str.charAt(i) - '0');
  }
  
  return num;
}


void display_obstatles()
{
  for (int i = obstatles.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Obstacle obst = (Obstacle) obstatles.get(i);
    obst.show();
    if (obst.finished()) {
      // Items can be deleted with remove()
      obstatles.remove(i);
    }
  }
}

