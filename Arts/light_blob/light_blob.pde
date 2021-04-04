float t = 0;

ArrayList<Blob> blobs = new ArrayList<Blob>();
int n_blobs = 30;

void setup() {
  size(500,500);
  frameRate(60);
  noStroke();
  noFill();
  
  for (int n = 0; n < n_blobs; n++) {
    color c = color(random(255), random(255), random(255));
    float r = 50 + n*3;   // each time generate slightly larger blob
    int alpha = min(200 - n*10, 40);  // each time with lower alpha
    Blob blob = new Blob(r, c, alpha, int(random(1000)));
    blobs.add(blob);
  }
}


void draw() {
  
  background(0);
  blendMode(ADD);

  for (Blob b: blobs) {
    b.draw(t);
  }
  
  t = frameCount / 150.0;
}
