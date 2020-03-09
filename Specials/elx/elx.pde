
static int NODE_SIZE = 10;

node root;
node[] leaf;

void setup() {
  size(800, 600);
  root = new node((node)null);
  
  leaf = new node[NODE_SIZE];
  for (int i = 0; i < NODE_SIZE; i++) {
    leaf[i] = new node(root);
  }
}


void draw() {
  background(200);
  
  for (int i = 0; i < NODE_SIZE; i++) {
    leaf[i].show();
    leaf[i].move();
  }
  
  root.show();
  root.move();
  root.speak();
}