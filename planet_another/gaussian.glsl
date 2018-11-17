uniform sampler2D texture;
uniform bool horizontal;
uniform float weight[10];

void main()
{
    float tFrag = 1.0 / 500.0;
    vec2 fc;
    vec3 color = vec3(0.0);

    if(horizontal)
    {
        fc = vec2(gl_FragCoord.x, 500.0 - gl_FragCoord.y);
        color += texture2D(texture, (fc + vec2(-9.0, 0.0)) * tFrag).rgb * weight[9];
        color += texture2D(texture, (fc + vec2(-8.0, 0.0)) * tFrag).rgb * weight[8];
        color += texture2D(texture, (fc + vec2(-7.0, 0.0)) * tFrag).rgb * weight[7];
        color += texture2D(texture, (fc + vec2(-6.0, 0.0)) * tFrag).rgb * weight[6];
        color += texture2D(texture, (fc + vec2(-5.0, 0.0)) * tFrag).rgb * weight[5];
        color += texture2D(texture, (fc + vec2(-4.0, 0.0)) * tFrag).rgb * weight[4];
        color += texture2D(texture, (fc + vec2(-3.0, 0.0)) * tFrag).rgb * weight[3];
        color += texture2D(texture, (fc + vec2(-2.0, 0.0)) * tFrag).rgb * weight[2];
        color += texture2D(texture, (fc + vec2(-1.0, 0.0)) * tFrag).rgb * weight[1];
        color += texture2D(texture, (fc + vec2( 0.0, 0.0)) * tFrag).rgb * weight[0];
        color += texture2D(texture, (fc + vec2( 1.0, 0.0)) * tFrag).rgb * weight[1];
        color += texture2D(texture, (fc + vec2( 2.0, 0.0)) * tFrag).rgb * weight[2];
        color += texture2D(texture, (fc + vec2( 3.0, 0.0)) * tFrag).rgb * weight[3];
        color += texture2D(texture, (fc + vec2( 4.0, 0.0)) * tFrag).rgb * weight[4];
        color += texture2D(texture, (fc + vec2( 5.0, 0.0)) * tFrag).rgb * weight[5];
        color += texture2D(texture, (fc + vec2( 6.0, 0.0)) * tFrag).rgb * weight[6];
        color += texture2D(texture, (fc + vec2( 7.0, 0.0)) * tFrag).rgb * weight[7];
        color += texture2D(texture, (fc + vec2( 8.0, 0.0)) * tFrag).rgb * weight[8];
        color += texture2D(texture, (fc + vec2( 9.0, 0.0)) * tFrag).rgb * weight[9];
    }
    else
    {
        fc = gl_FragCoord.xy;
        color += texture2D(texture, (fc + vec2(0.0, -9.0)) * tFrag).rgb * weight[9];
        color += texture2D(texture, (fc + vec2(0.0, -8.0)) * tFrag).rgb * weight[8];
        color += texture2D(texture, (fc + vec2(0.0, -7.0)) * tFrag).rgb * weight[7];
        color += texture2D(texture, (fc + vec2(0.0, -6.0)) * tFrag).rgb * weight[6];
        color += texture2D(texture, (fc + vec2(0.0, -5.0)) * tFrag).rgb * weight[5];
        color += texture2D(texture, (fc + vec2(0.0, -4.0)) * tFrag).rgb * weight[4];
        color += texture2D(texture, (fc + vec2(0.0, -3.0)) * tFrag).rgb * weight[3];
        color += texture2D(texture, (fc + vec2(0.0, -2.0)) * tFrag).rgb * weight[2];
        color += texture2D(texture, (fc + vec2(0.0, -1.0)) * tFrag).rgb * weight[1];
        color += texture2D(texture, (fc + vec2(0.0,  0.0)) * tFrag).rgb * weight[0];
        color += texture2D(texture, (fc + vec2(0.0,  1.0)) * tFrag).rgb * weight[1];
        color += texture2D(texture, (fc + vec2(0.0,  2.0)) * tFrag).rgb * weight[2];
        color += texture2D(texture, (fc + vec2(0.0,  3.0)) * tFrag).rgb * weight[3];
        color += texture2D(texture, (fc + vec2(0.0,  4.0)) * tFrag).rgb * weight[4];
        color += texture2D(texture, (fc + vec2(0.0,  5.0)) * tFrag).rgb * weight[5];
        color += texture2D(texture, (fc + vec2(0.0,  6.0)) * tFrag).rgb * weight[6];
        color += texture2D(texture, (fc + vec2(0.0,  7.0)) * tFrag).rgb * weight[7];
        color += texture2D(texture, (fc + vec2(0.0,  8.0)) * tFrag).rgb * weight[8];
        color += texture2D(texture, (fc + vec2(0.0,  9.0)) * tFrag).rgb * weight[9];
    }
    gl_FragColor = vec4(color, 1.0);
}