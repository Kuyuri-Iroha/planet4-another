// Planet_Another
//
// Kuyuri Iroha
// 2018


MouseCamera cam;
Planet planet;

void setup()
{
  size(500, 500, P3D);
  planet = new Planet();
  cam = new MouseCamera();
}


void draw()
{
  background(#0f0f0f);
  cam.update();
  planet.update();
  cam.begin();
  cam.cam();
  cam.end();
  planet.draw();
}
