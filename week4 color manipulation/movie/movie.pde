
import processing.video.*;

Movie ourMovie; 
PShader myFragShader;                                              // variable to hold shader

void setup() {
  size(1020, 400, P2D);                                             // must be P2D or P3D for shaders
                                                
  myFragShader = loadShader("FragShaderThreshold.glsl");     // our shader file has to be in our folder
  ourMovie = new Movie(this, "fish.mp4"); 
  println("OK");
   ourMovie.loop();  
   background(255);
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  //background(255);
   
   // we have to draw the live video to the window
  float adjustAmount= map (mouseX, 0,width, 0,1);                 // and the shader will transform it 
  myFragShader.set("param1",adjustAmount);    // pass paramater to shader
 
  myFragShader.set("iTime",millis()/1000.); 
  shader(myFragShader);         
  push();
  translate(220,200);
  imageMode(CENTER);
  rotate(-millis()/1000.);
  image(ourMovie,0,0);// call shader
  pop(); 
  push();
  translate(800,200);
  imageMode(CENTER);
  rotate(millis()/1000.);
  image(ourMovie,0,0);// call shader
  pop();
}
