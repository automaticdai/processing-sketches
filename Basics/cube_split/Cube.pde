class Cube {
  PVector pos;
  float r;
  
  Cube(float x_, float y_, float z_, float r_) {
    pos = new PVector(x_, y_, z_);
    r = r_;
  }

  void show() {
    pushMatrix();
    noFill();
    translate(pos.x, pos.y, pos.z);
    box(r);
    popMatrix();
  }
  
  ArrayList<Cube> divide() {
    
    ArrayList<Cube> cubes = new ArrayList<Cube>();
    
    float r_n = r / 3;
    
    cubes.add(new Cube(pos.x, pos.y, pos.z, r_n));
    cubes.add(new Cube(pos.x + r_n, pos.y,       pos.z      , r_n));
    cubes.add(new Cube(pos.x      , pos.y + r_n, pos.z      , r_n));
    cubes.add(new Cube(pos.x - r_n, pos.y,       pos.z      , r_n));
    cubes.add(new Cube(pos.x      , pos.y - r_n, pos.z      , r_n));
    cubes.add(new Cube(pos.x      , pos.y      , pos.z + r_n, r_n));
    cubes.add(new Cube(pos.x      , pos.y      , pos.z - r_n, r_n));
    
    return cubes;
  }

}