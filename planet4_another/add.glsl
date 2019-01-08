uniform float origin;
uniform float add;
uniform sampler2D texOrigin;
uniform sampler2D texAdd;

void main()
{
    ivec2 p = ivec2(gl_FragCoord.xy);
    gl_FragColor = min(texelFetch(texOrigin, p, 0) * origin + texelFetch(texAdd, p, 0) * add, vec4(1.0));
}