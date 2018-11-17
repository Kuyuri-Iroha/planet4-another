uniform float m;
uniform sampler2D texture;
uniform sampler2D rendered;

void main()
{
    ivec2 p = ivec2(gl_FragCoord.xy);
    gl_FragColor = texelFetch(texture, p, 0) + texelFetch(rendered, p, 0) * m;
}