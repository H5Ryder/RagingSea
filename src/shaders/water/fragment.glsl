uniform vec3 uDepthColor;
uniform vec3 uSurfaceColor;
uniform vec3 uBackgroundColor;

uniform float uColorOffset;
uniform float uColorMultiplier;

uniform float uFogStart;
uniform float uFogEnd;

varying float vElevation;
varying float vDist;
varying vec3 vPosition;
varying vec3 vNormal;

#include ../includes/pointLight.glsl

void main() {

    vec3 viewDirection = normalize(vPosition - cameraPosition);
    vec3 normal = normalize(vNormal);

    // Base Color
    float mixStrength = (vElevation + uColorOffset) * uColorMultiplier;
    mixStrength = smoothstep(0.0, 1.0, mixStrength);
    vec3 color = mix(uDepthColor, uSurfaceColor, mixStrength);

    //  Fog
   // vec3 fogColor = LinearTosRGB(vec4(uBackgroundColor, 1.0)).rgb; // Convert uBackgroundColor to vec4 by adding alpha value
  //  float fogFactor = (vDist - uFogStart) / (uFogEnd - uFogStart);
  //  fogFactor = clamp(fogFactor, 0.0, 1.0);

      // Light
    vec3 light = vec3(0.0);

    light += pointLight(
        vec3(1.0),
        8.0,
        normal,
        vec3(0.0, 0.5, 0.0),
        viewDirection,
        20.0,
        vPosition,
        0.9
        );

    color *= light;

    // Final Color
    //vec3 finalColor = mix(color, fogColor, fogFactor);
    gl_FragColor = vec4(color, 1.0);
    #include <tonemapping_fragment>
    #include <colorspace_fragment>

}