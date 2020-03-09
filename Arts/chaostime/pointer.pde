class Pointer {
  int     len;
  PVector origin_pos;
  
  Pointer(PVector _origin, int _len) {
    len = _len;
    origin_pos = _origin;
  }
  
  void display(float angle) {
      pushMatrix();
      pushStyle(); 
      
      translate(origin_pos.x, origin_pos.y);
      strokeWeight(2);
      
      beginShape(TRIANGLES);
      vertex(0,0);
      vertex(len*cos((angle-(2))/180*PI), len*sin((angle-(2))/180*PI)); 
      vertex(len*cos((angle+(2))/180*PI), len*sin((angle+(2))/180*PI));         
      endShape();
      
      popStyle(); 
      popMatrix();
  }



}