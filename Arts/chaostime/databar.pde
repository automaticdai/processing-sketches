class Databar {
  PVector pos;
  int     value;
  float   i_noise;
  
  Databar(PVector _pos, int _value) {
    pos = _pos;
    value = _value;
    i_noise = int(random(1000));
  }
  
  void show() {
      int value_new;
      PVector mouse_pos = new PVector(mouseX, mouseY);
      colorMode(HSB);
      if ( PVector.dist(mouse_pos,pos) < 50 ) {
        value_new = int(map(noise(i_noise),0,1,value,value+10));
        fill(value_new, 255, 255);
      }
      else {
        value_new = int(map(noise(i_noise),0,1,0,100));
        fill(255 - value_new);
      }
      translate(pos.x, pos.y, 0);
      i_noise += 0.02;
      box(6, 6, value_new);
      translate(-pos.x, -pos.y, 0);
  }

}