// Planet_Another
//
// Kuyuri Iroha
// 2018


MouseCamera cam;
Planet planet;
PGraphics render;
PShader blurShader;
float gauss = 50.0;
float[] gaussianWeight = new float[10];

PVector rotateVectorFromEuler(PVector source, float x, float y, float z)
{
  // z -> x -> z Euler
  float[][] rot = new float[][] {
    {cos(z)*cos(x) - sin(z)*cos(y)*sin(x), cos(z)*sin(x) + sin(z)*cos(y)*cos(x), sin(z)*sin(y)},
    {-sin(z)*cos(x) - cos(z)*cos(y)*sin(x), -sin(z)*sin(x) + cos(z)*cos(y)*cos(x), cos(z)*sin(y)},
    {sin(y)*sin(x), -sin(y)*cos(x), cos(y)}
  };
  PMatrix3D mat = new PMatrix3D(
    rot[0][0], rot[0][1], rot[0][2], 0.0,
    rot[1][0], rot[1][1], rot[1][2], 0.0,
    rot[2][0], rot[2][1], rot[2][2], 0.0,
    0.0,       0.0,       0.0,       1.0
  );
    
  return mat.mult(source, null);
}

float smoothstep(float p1, float p2, float t)
{
  float f = min(1.0, max(0.0, (t-p1)/(p2-p1)));
  return f * f * (3.0 - 2.0 * f);
}

void setup()
{
  size(500, 500, P3D);
  frameRate(50);
  planet = new Planet();
  cam = new MouseCamera();
  render = createGraphics(width, height, P3D);
  blurShader = loadShader("blur.glsl");
  smooth(32);

  // Gaussian Weight
  float t = 0.0;
  float d = gauss * gauss / 100.0;
  for(int i = 0; i < gaussianWeight.length; i++)
  {
    float r = 1.0 + 2.0 * i;
    float w = exp(-0.5 * (r * r) / d);
    gaussianWeight[i] = w;
    if(i > 0) {w *= 2.0;}
    t += w;
  }

  for(int i = 0; i < gaussianWeight.length; i++)
  {
    gaussianWeight[i] /= t;
  }
}


void draw()
{
  clear();
  for(int i=0; i<10; i++)
  {
    float t = float(frameCount%400)/50 + float(i)/1000.0;
    
    render.beginDraw();
    render.background(0);
    cam.update();
    planet.update(t);
    render.beginCamera();
    cam.cam(render);
    render.endCamera();
    planet.draw(render);
    render.endDraw();
  
    blurShader.set("rendered", render);
    blurShader.set("m", sin(PI*i/10)*0.2);
    filter(blurShader);
  }
  
  /*
  saveFrame("capture/####.png"); //<>//
  if(400 < frameCount)
  {
    exit();
  }
  */
}
