varying vec3 vUv;

uniform vec3 colorA;
uniform vec3 colorB;
uniform vec3 colorC;
uniform vec3 colorD;
uniform vec3 colorE;

void main() {
  gl_FragColor = vec4(mix(colorA, colorB, colorC, colorD, colorE, vUv.z), 1.0);
}

