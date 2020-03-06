

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;



varying vec4 vertColor;
varying vec4 vertTexCoord;

float N21 (vec2 p){
	float d = fract(sin(p.x*110.+(8.21-p.y)*331.)*1218.);
    return d;
}


void main() {
/* all of these are calculating the location (X,Y) of the 9 pixels that make up the area */
 // vec2 tc0 = vertTexCoord.st + vec2(-texOffset.s, -texOffset.t);
	vec2 uv=vertTexCoord.xy;

    // Time varying pixel color
    // Time varying pixel color
    vec3 col =texture2D(texture,uv).rgb;
	vec3 col0=col;
    vec3 colN=col;
    
    float range=1./100.;
    float n=8.;
    float colX=0.;

        colN=vec3(0.);
    for (float i=-range;i<=range;i+=range/n){
        for (float j=-range;j<=range;j+=range/n){
            vec3 col2=texture2D(texture,uv+vec2(i,j)).rgb;
            
            colN+=1./70.*(col2-col0);
           
    	}
    
	}
	colN-=0.1;
	colN=clamp(colN,vec3(0.),vec3(1.));
	
	colN=vec3(length(colN));
    vec3 colF=-1.*colN+col0;
	//colF*=clamp(1./length(uv-.5),0.5,1.);
	colF+=vec3(0.2,0.3,0.6)*smoothstep(0.2,0.3,length(colF.gb))*N21(uv);
    gl_FragColor =  vec4(colF,1.);


}
