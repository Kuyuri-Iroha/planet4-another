
class Satellite
{
  int size = 10;
  PVector pos;
  
  Satellite()
  {
    pos = new PVector();
  }
  
  void update(float t)
  {
  }
  
  void draw(PGraphics render)
  {
    render.translate(pos.x, pos.y, pos.z);
    render.sphere(size);
  }
  
}
