// Planet_Another
//
// Kuyuri Iroha
// 2018


MouseCamera cam;
Planet planet;
PGraphics render;
PShader fsShader;

void setup()
{
  size(500, 500, P3D);
  frameRate(50);
  planet = new Planet();
  cam = new MouseCamera();
  render = createGraphics(width, height, P3D);
  fsShader = loadShader("fs.glsl");
}


void draw()
{
  background(0);
  for(int i=0; i<10; i++)
  {
    float t = float(frameCount)/50 + float(i)/20;
    
    render.beginDraw();
    render.background(#0f0f0f);
    cam.update();
    planet.update(t);
    render.beginCamera();
    cam.cam(render);
    render.endCamera();
    planet.draw(render);
    render.endDraw();
  
    fsShader.set("size", width, height);
    fsShader.set("rendered", render);
    fsShader.set("m", sin(PI*i/10)*0.2);
    filter(fsShader);
  }
}
