uniform vec3 uDepthColor;
uniform vec3 uSurfaceColor;
uniform vec3 uBackgroundColor;

uniform float uColorOffset;
uniform float uColorMultiplier;

varying float vElevation;
varying float vDist;

void main() 
{



    vec3 color = mix(uDepthColor, uSurfaceColor, vElevation * uColorMultiplier + uColorOffset);
    vec3 fogColor = uBackgroundColor;


    float fogFactor = (vDist*1.0 - 0.3)/ (1.0-0.3);
    vec3 finalColor = mix(color, fogColor, fogFactor);

   
    
    gl_FragColor = vec4(finalColor, 1.0);
}