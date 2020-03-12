

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;                    // this is the whole image coming in
varying vec4 vertTexCoord;                    // this is the coordinates of this fragment (pixel?)
uniform float param1;                         // this is a variable for our parameter sent from Processing
uniform float iTime; 

mat2 rot(float m){
	return mat2 (cos(m),-sin(m),sin(m),-cos(m));
}
void main() {
vec2 uv=vertTexCoord.st;
uv=(uv-0.5)/vec2(1.,0.6);

	vec4 thisPixColor = texture2D(texture, vertTexCoord.st-0.025/dot(vertTexCoord.st-.5,vertTexCoord.st-.5)*(param1-0.5));                        // get the color of our pixel
	vec3 yuan=thisPixColor.rgb;
	float thisPixBrightness= (thisPixColor.r+thisPixColor.g+thisPixColor.b)/3.;      // average to get gray brightness 
	vec3 col;
	//vec3 col=vec3(0.3,0.4,0.7)*(0.2*sin(uv.x*20.)+0.5-sin(uv.y*10.+0.2*sin(uv.x*22.23)+0.5));
	col=1.5*(yuan-vec3(.3))+vec3(.3);
	col*=max(vec3(1.),vec3(0.2,0.2,0.7)*0.2/(pow(length(uv-vec2(sin(iTime/2.),cos(iTime/2.))*.3),1.)*(1.5+sin(iTime)))+1.);
	col*=max(vec3(1.),vec3(0.5,0.5,0.5)*0.2/(pow(length(uv-vec2(sin(iTime/1.5),cos(iTime/1.5))*.5),1.)*(1.5+sin(iTime)))+1.);
  		float m=smoothstep(0.5,0.45,length(uv));
		float a=0.02*m*param1*(0.002*(10.*sin(iTime/3.)+10.)/pow(length(uv-vec2(-0.2,0.2)),5.));
		gl_FragColor = vec4(col,a);                          // if our pixel is dark make a vec4 with black
  	
}
