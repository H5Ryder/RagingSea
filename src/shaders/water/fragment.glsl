uniform vec3 uDepthColor;
uniform vec3 uSurfaceColor;
uniform vec3 uBackgroundColor;

uniform float uColorOffset;
uniform float uColorMultiplier;

uniform float uFogStart;
uniform float uFogEnd;

varying float vElevation;
varying float vDist;




void main() {


    vec3 color = mix(uDepthColor, uSurfaceColor, vElevation * uColorMultiplier + uColorOffset);
    vec3 fogColor = LinearTosRGB(vec4(uBackgroundColor, 1.0)).rgb; // Convert uBackgroundColor to vec4 by adding alpha value

    float fogFactor = (vDist - uFogStart) / (uFogEnd - uFogStart);
    fogFactor = clamp(fogFactor, 0.0, 1.0);
    vec3 finalColor = mix(color, fogColor, fogFactor);

    gl_FragColor = vec4(finalColor, 1.0);
}