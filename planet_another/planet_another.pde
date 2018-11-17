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

void setup()
{
  size(500, 500, P3D);
  frameRate(50);
  planet = new Planet();
  cam = new MouseCamera();
  render = createGraphics(width, height, P3D);
  blurShader = loadShader("blur.glsl");
//  smooth(32);

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
    float t = float(frameCount)/50 + float(i)/20;
    
    render.beginDraw();
    render.background(#000000);
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
//  saveFrame("capture/####.png"); //<>//
}
