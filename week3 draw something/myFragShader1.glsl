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

float LineDistance(vec2 a, vec2 b, vec2 p){
	vec2 ap = p-a;
    vec2 ab = b-a;
    float t = clamp(dot (ap,ab)/dot(ab,ab),0.0,1.0);
    vec2 at = t*ab;
    vec2 pt = at-ap;
    float off=N21(vec2(p.y,p.y));
    return length(pt)-0.04*off;
}

void main() {

	vec2 uv = vertTexCoord.xy-0.5;
	
    // Time varying pixel color
    vec3 col ;
    float d= LineDistance(vec2(0.,0.4),vec2(0.,-0.4),uv+0.003*N21(vec2(uv.x+0.00001*uv.y,uv.x))+3.*blend*sin(2.*uv.y+iTime));
	
    float off=fract(iTime);
	float m= S(0.6,0.3,fract(uv.y*3.));
    d=S(0.04+0.03*m,0.,d);
    
    col=vec3(0.3,0.7+m*0.3,0.5)*d+off*2.*vec3(0.0,-0.4,-0.8);
    
    float dd=S(-0.0,0.01,uv.x+3.*blend*sin(2.*uv.y+iTime)+0.003*N21(vec2(uv.x+0.00001*uv.y,uv.x)));
	float ds=S(-0.02,-0.025,uv.x+3.*blend*sin(2.*uv.y+iTime));
	ds*=S(-0.035,-0.02,uv.x+3.*blend*sin(2.*uv.y+iTime));
    col=mix(col,vec3(0.1),0.7*dd*d);
	col=mix(col,vec3(0.9),0.7*ds);
	//d=length(uv);
	//col=vec3(d);
    // Output to screen
    gl_FragColor = vec4(col,d);





	
}
