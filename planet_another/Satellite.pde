
class Satellite
{
  int size = 10;
  PVector pos;
  Orientation ori;
  PVector offset;
  PVector euler;
  
  Satellite()
  {
    pos = new PVector();
    ori = new Orientation();
    offset = new PVector();
    euler = new PVector();
  }
  
  void update(float t)
  {
    float divedT = -t;
    euler.x += noise(divedT + offset.x) / 100.0;
    euler.y += noise(divedT + offset.y) / 100.0;
    euler.z += noise(divedT + offset.z) / 100.0;
    pos = ori.pos;
  }
  
  void draw(PGraphics render)
  {
    render.pushMatrix();
    render.rotateX(euler.x);
    render.rotateY(euler.y);
    render.rotateZ(euler.z);
    render.translate(pos.x, pos.y, pos.z);
    render.sphere(size);
    render.popMatrix();
  }
  
}
