ArrayList<Cube> cubes;

void setup() {
  size(1000, 1000, P3D);
  cubes = new ArrayList<Cube>();
  cubes.add(new Cube(0, 0, 0, 500));
}


void draw() {
  background(255);
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI, PI));
  for (int i = cubes.size() - 1; i >= 0; i--) {
    cubes.get(i).show();
  }
}


void mouseClicked(){
  for (int i = cubes.size() - 1; i >= 0; i--) {
    ArrayList<Cube> new_cubes = cubes.get(i).divide();
    for (Cube cube: new_cubes) {
      cubes.add(cube);
    }
    cubes.remove(i);
  }
}