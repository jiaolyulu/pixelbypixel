#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

varying vec4 vertColor;											// this is our fragment color coming in
varying vec4 vertTexCoord;                  // this is our fragment (pixel) coords
uniform float iTime;                       // these are our arguments

uniform float blend;  
#define S(a,b,t) smoothstep(a,b,t)
float N21 (vec2 p){
	float d = fract(sin(p.x*110.+(8.21-p.y)*331.)*1218.);
    return d;
}



void main() {

	vec2 uv = vertTexCoord.xy-0.5;
	
    // Time varying pixel color
    vec3 col =vec3(0.4,0.4,0.1)*uv.x;
    float d= (uv.x+0.8*N21(vec2(floor(uv.y*300.))))*N21(vec2(uv.y*uv.x*1.+0.00001*uv.x,uv.y));
	
    
    
    col=mix(col,vec3(0.45,0.35,0.15),d);
    float d1= (uv.x+0.3)*N21(vec2(uv.y*0.0005,uv.y+0.00001*uv.x));
	
    
    
    col=mix(col,vec3(0.47,0.37,0.07),d1)*(2.0*uv.x+2.);
	//d=length(uv);
	//col=vec3(d);
    // Output to screen
    gl_FragColor = vec4(col,d+d1);





	
}
