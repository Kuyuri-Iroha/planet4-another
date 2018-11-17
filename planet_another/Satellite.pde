
class Satellite
{
  int size = 10;
  PVector pos;
  
  Satellite()
  {
    pos = new PVector();
  }
  
  void update()
  {
  }
  
  void draw()
  {
    translate(pos.x, pos.y, pos.z);
    sphere(size);
  }
  
}
