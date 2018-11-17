// Planet_Another
//
// Kuyuri Iroha
// 2018


MouseCamera cam;
Planet planet;
PGraphics render;

void setup()
{
  size(500, 500, P3D);
  planet = new Planet();
  cam = new MouseCamera();
  render = createGraphics(width, height, P3D);
}


void draw()
{
  float t = frameCount;
  render.beginDraw();
  render.background(#0f0f0f);
  cam.update();
  planet.update(t);
  render.beginCamera();
  cam.cam(render);
  render.endCamera();
  planet.draw(render);
  render.endDraw();
  image(render, 0, 0);
}
