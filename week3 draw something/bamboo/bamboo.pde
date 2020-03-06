
float mx1,my1,mx2,my2;
boolean pMouseState=false;
boolean MouseState;
float timeStart,timeEnd=0.;
PShader myFragShader;     
PShader myFragShader1;     // variable to hold shader
float counter , dir = 0.001;            
PGraphics pic,pic1;
void setup() {
  size(1000, 700, P3D);     // must be P2D or P3D for shaders
  pic=createGraphics(1000,700,P3D);
  pic1=createGraphics(1000,700,P3D);
  background(2);
  frameRate(400);                                    // set high FPS, defaults to 60
  myFragShader = loadShader("myFragShader1.glsl");    // our shader file has to be in our folder
  myFragShader1 = loadShader("myFragShader2.glsl");
  shader(myFragShader1);
  pic1.shader(myFragShader1);
  push();
  rectMode(CENTER);
  translate(500,350);
  rotate(-random(314)/100.);
  texture(pic1);
  rect(0,0,1200,1200);
  image(pic1,0,0);
  pop();
}

void draw() {
  //mouseState=mousePressed();
  
  counter +=dir;
  if (counter > 1 || counter < 0)dir = -dir;
  //rect(0, 0, width, height);                          // draw something, otherwise shader wont work
  shader(myFragShader);
  myFragShader.set("iTime", millis()/1000.);
  myFragShader.set("blend", 0.05);
  
  // call the shader
 // println (frameRate);
  pic.shader(myFragShader);
  pic.rect(0,0,1000,700);
  //image(pic,0,0);
 
}
void mousePressed(){
  if (pMouseState==false){
    //fill(255);
   // ellipse(mouseX,mouseY,10,10);
  mx1=mouseX;
  my1=mouseY; //<>//
  timeStart=millis()/1000.;
}
pMouseState=true;
}
void mouseReleased(){
   //fill(255);
   
  mx2=mouseX;
  my2=mouseY;
  pMouseState=false;
  timeEnd=millis()/1000.;
  ellipse(mouseX,mouseY,10.*(timeEnd-timeStart),10);
  push();
  float blend;
  if (mx2==mx1){
    blend=PI/2;}
    else{
    
  blend=-atan((mx2-mx1)/(my2-my1));}
  
  myFragShader.set("blend", blend/5.);
  pic.shader(myFragShader);
  pic.rect(0,0,1000,700);
  texture(pic);
  noStroke();
  translate(mouseX,mouseY);
  rotate(blend);
  rectMode(CENTER);
  println(100.+50.*max(0.,min(4.,timeEnd-timeStart)));
  rect(0,0,100.+350.*max(0.,min(2.,timeEnd-timeStart)),500*random(2)+500.);
  pop();
}
void mouseClicked(){
  
}
