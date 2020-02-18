// The world pixel by pixel 2020
// Daniel Rozin
// paint lines

void setup() {
  size(1000, 800);
}

void draw() {
  fill(255,100);
  rect(0, 0, width, height);
  for (int i = 0; i< 100; i+=1) {
    for (float j=29;j>1.5;j-=0.5){
    float thisX= ((mouseX+1000) /3+ 200*sin((float(i)+0.54*j)/100*3.14+4.34)-500)*(j%5)+500;
    float thisY= ((mouseY +800)/3+ 200*cos((float(i)+0.63*j)/100*3.14+4.34)-400)*(j%5)+400;
    strokeWeight(j%4*((i+millis()*0.001)%2+1));
    stroke (225-15*j*(j%2)+10*sin((float(i)+millis()*0.01)/100*6.283), 275-15*j+20*cos((float(i)+millis()*0.01)/100*6.283), 205-10*j+10*cos((float(i)+millis()*0.1)/100*6.28));
    line(thisX, thisY, 500+20*(j%8-4.)+(j%5-2.5)*200,400+20*(j%8-4.)+(j%5-2.5)*(j%2-0.5)*600);
    
    }
   
  }
  
}
