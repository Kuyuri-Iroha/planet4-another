// Planet_Another
//
// Kuyuri Iroha
// 2018


Planet planet;

void setup()
{
  size(500, 500, P3D);
  planet = new Planet();
}


void draw()
{
  background(#0f0f0f);
  planet.update();
  planet.draw();
}
