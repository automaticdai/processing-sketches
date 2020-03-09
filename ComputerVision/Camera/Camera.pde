import processing.video.*;

Capture cam;

void setup(){
  size(640, 480);
  
  String[] cameras = Capture.list();
  
  if (cameras.length == 0){
    println("There are no camera!");
    exit();
  } else {
    for ( int i = 0; i < cameras.length; i++ ){
      println(cameras[i]);
    }
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  //image(cam, 0, 0);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  set(0, 0, cam);
}
