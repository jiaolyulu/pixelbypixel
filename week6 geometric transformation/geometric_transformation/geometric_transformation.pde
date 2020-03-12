
import processing.video.*;

float angle;
Capture video;
PShader myFragShader;

void setup() {
  size(640, 480, P2D);
  frameRate(30);             
  myFragShader = loadShader("mirror.glsl");
  video = new Capture(this,width, height);
  video.start();
}
void captureEvent(Capture c) {
  c.read();
}

void draw() {
  image(video,0,0);
  myFragShader.set("iTime",millis()/1000);
  shader(myFragShader);
  println (frameRate);
}
