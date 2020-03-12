// The world pixel by pixel 2020
// Daniel Rozin
//  fragment shader to do a flip

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;
uniform float iTime;
varying vec4 vertColor;
varying vec4 vertTexCoord;

vec2 distort(vec2 uv,vec2 p,float size){
    uv-=p;
    float d=length(uv);
    d=smoothstep(size,0.,d);
    vec2 st;
    st=2.*d*((uv)*(uv));
    return st;
}
float m(float speed){
	return sin(iTime*speed)*0.5+0.5;
}
float distort1(vec2 uv,vec2 p,float size){
    uv-=p;
    float d=length(uv);
    d=smoothstep(size,0.,d);
    float off=1.*d*(size*size-dot(uv,uv));
    return off;
}
void main() {
	vec2 uv = vertTexCoord.xy;
	
    uv+=distort(uv,vec2(0.5),0.2);
    uv+=distort1(uv,vec2(0.1,0.),0.1);
    for(float i=0.;i<1.;i+=0.1){
        for(float j=0.;j<1.;j+=0.1){
    		uv+=150.*distort(uv,vec2(i,j),0.08*(1.-m(2.)));
    		uv-=150.*distort(uv,vec2(i+0.05,j+0.05),0.08*m(2.));
        }    
    }
    // Time varying pixel color
    vec3 col = texture2D(texture,uv).rgb;
	//col=vec3(uv.x,uv.y,0.);
    // Output to screen


	gl_FragColor =vec4(col,1.0) ;                                            //  setting that color as the output
}
