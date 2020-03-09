import SimpleOpenNI.*;
 
SimpleOpenNI  context;
 
void setup()
{
  // instantiate a new context
  context = new SimpleOpenNI(this);
 
  // enable depthMap generation 
  context.enableDepth();
 
  // enable skeleton generation for all joints
  context.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);
 
  background(200,0,0);
  stroke(0,0,255);
  strokeWeight(3);
  smooth();
 
  // create a window the size of the depth information
  size(context.depthWidth(), context.depthHeight()); 
}
 
void draw()
{
  // update the camera
  context.update();
 
  // draw depth image
  image(context.depthImage(),0,0); 
 
  // instantiate the rect depth to 0
  float d = 0;
  // for user 1
  // check if the skeleton is being tracked
  if(context.isTrackingSkeleton(1))
  {
    // draw the skeleton
    drawSkeleton(1);  
 
    // draw a circle for a head
    circleForAHead(1); 
 
    // get the distance between joints
    float handDistance = getJointDistance(1, SimpleOpenNI.SKEL_LEFT_HAND,SimpleOpenNI.SKEL_RIGHT_HAND);
    d = map(handDistance, 0, 2000, 0, height);
  }
  rect(10, 10, 50, d);
}
 
// draws a circle at the position of the head
void circleForAHead(int userId)
{
  // get 3D position of a joint
  PVector jointPos = new PVector();
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_HEAD,jointPos);
 
  // convert real world point to projective space
  PVector jointPos_Proj = new PVector(); 
  context.convertRealWorldToProjective(jointPos,jointPos_Proj);
 
  // a 200 pixel diameter head
  float headsize = 200;
 
  // create a distance scalar related to the depth (z dimension)
  float distanceScalar = (525/jointPos_Proj.z);
 
  // set the fill colour to make the circle green
  fill(0,255,0); 
 
  // draw the circle at the position of the head with the head size scaled by the distance scalar
  ellipse(jointPos_Proj.x,jointPos_Proj.y, distanceScalar*headsize,distanceScalar*headsize);  
}
 
// draw the skeleton with the selected joints
void drawSkeleton(int userId)
{  
  // draw limbs  
  context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);  
}
 
// Event-based Methods
 
// when a person ('user') enters the field of view
void onNewUser(int userId)
{
  println("New User Detected - userId: " + userId);
 
 // start pose detection
  context.startPoseDetection("Psi",userId);
}
 
// when a person ('user') leaves the field of view 
void onLostUser(int userId)
{
  println("User Lost - userId: " + userId);
}
 
// when a user begins a pose
void onStartPose(String pose,int userId)
{
  println("Start of Pose Detected  - userId: " + userId + ", pose: " + pose);
 
  // stop pose detection
  context.stopPoseDetection(userId); 
 
  // start attempting to calibrate the skeleton
  context.requestCalibrationSkeleton(userId, true); 
}
 
// when calibration begins
void onStartCalibration(int userId)
{
  println("Beginning Calibration - userId: " + userId);
}
 
// when calibaration ends - successfully or unsucessfully 
void onEndCalibration(int userId, boolean successfull)
{
  println("Calibration of userId: " + userId + ", successfull: " + successfull);
 
  if (successfull) 
  { 
    println("  User calibrated !!!");
 
    // begin skeleton tracking
    context.startTrackingSkeleton(userId); 
  } 
  else 
  { 
    println("  Failed to calibrate user !!!");
 
    // Start pose detection
    context.startPoseDetection("Psi",userId);
  }
}
 
// prints out the distance between any two joints 
float getJointDistance(int userId,int joint1Id,int joint2Id)
{
  float d;    // to store final distance value
 
  // two PVectors to hold the position of two joints
  PVector joint1 = new PVector();
  PVector joint2 = new PVector();
 
  // get 3D position of both joints
  context.getJointPositionSkeleton(userId,joint1Id,joint1);
  context.getJointPositionSkeleton(userId,joint2Id,joint2);
 
  d = distance3D(joint1,joint2);    // calcualte the distance between the two joints
 
  return d;
}
 
// calculate the distance between any two points in 3D space and return it as a float
float distance3D(PVector point1, PVector point2)
{
   float diff_x, diff_y, diff_z;    // to store differences along x, y and z axes
   float distance;                  // to store final distance value
 
   // calculate the difference between the two points
   diff_x = point1.x - point2.x;
   diff_y = point1.y - point2.y;
   diff_z = point1.z - point2.z; 
 
   // calculate the Euclidean distance between the two points
   distance = sqrt(pow(diff_x,2)+pow(diff_y,2)+pow(diff_z,2));
 
   return distance;  // return the distance as a float
}
