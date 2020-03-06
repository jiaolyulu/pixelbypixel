
import processing.video.*;

Capture video;
PShader myFragShader,myFragShader1;                                              // variable to hold shader
PGraphics graph1,graph2;
void setup() {
  size(800, 600, P2D);     // must be P2D or P3D for shaders
  graph1= createGraphics(800, 600, P2D);
  graph2= createGraphics(800, 600, P2D);

  frameRate(200);                                                  // set high FPS, defaults to 60
  myFragShader = loadShader("FragShaderCartoon.glsl");     // our shader file has to be in our folder
  myFragShader1 = loadShader("FragShaderEdgeDetection.glsl");    // our shader file has to be in our folder
  
  

 
  video = new Capture(this,width, height);                          // open the video capture at size of window
  video.start();   
  // start the video capture
}
void captureEvent(Capture c) {                                      // this is a calback function, the video calls it 
  c.read();                                                          //when a frame is ready, and then reads the frame
}

void draw() {
  resetShader();
  graph1.beginDraw();
  graph1.image(video,0,0);
  
  myFragShader.set("sprite",video);// replacing this with myFragShader.set("sprite",graph1); everything does not work
  graph1.shader(myFragShader);   // call shader
  graph1.endDraw();
  shader(myFragShader1);
  push();
  imageMode(CENTER);
  rotate(3.14);
  image(graph1,-width/2,-height/2);      // we have to draw the live video to the window
  pop();

  
  
  
  
  println (frameRate);
}
