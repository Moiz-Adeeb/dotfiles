
precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 pixColor = texture2D(tex, v_texcoord);
    float gray = pixColor.r * 0.299 + pixColor.g * 0.587 + pixColor.b * 0.114;
    gl_FragColor = vec4(gray, gray, gray, pixColor.a);
}
