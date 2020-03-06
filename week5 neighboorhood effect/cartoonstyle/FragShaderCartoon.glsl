
// The world pixel by pixel 2020
// Daniel Rozin
// fragment shader to create edge detection effect

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D sprite;
uniform float iTime;


varying vec4 vertColor;
varying vec4 vertTexCoord;



void main() {
/* all of these are calculating the location (X,Y) of the 9 pixels that make up the area */
 // vec2 tc0 = vertTexCoord.st + vec2(-texOffset.s, -texOffset.t);
	vec2 uv=vertTexCoord.xy;
	uv.y=1.-uv.y;
    // Time varying pixel color
    vec3 col =texture2D(sprite,uv).rgb;
    vec3 col0 =col;
    vec3 colN=col;
    
    float range=1./30.;
    float n=4.;
    float colX=0.;
    if (uv.x>0.0){
        colN=vec3(0.);
    for (float i=-range;i<=range;i+=range/n){
        for (float j=-range;j<=range;j+=range/n){
            vec3 col2=texture2D(sprite,uv+vec2(i,j)).rgb;
            
            colN+=1./81.*(col2)/1.;
           
    	}
    }
    
      
        
        
    
    
    
    float N=0.;
    
    
    
	}


	colN=.9*(floor(colN*vec3(0.7,1.0,0.4)*vec3(6.,9.,12.))/vec3(6.,9.,12.)+vec3(.4,0.3,-0.1));

    gl_FragColor =  vec4(colN,1.);


}
