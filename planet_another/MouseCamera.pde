
class MouseCamera
{
  PVector prevMouse;
  Orientation ori;
  PVector eye;
  PVector center;
  PVector up;
  
  
  MouseCamera()
  {
    prevMouse = new PVector();
    ori = new Orientation();
    center = new PVector();
    up = new PVector();
    this.set(new PVector(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0)), new PVector(width/2.0, height/2.0, 0), new PVector(0, 1, 0)); 
  }
  
  void update()
  {
    if(mousePressed)
    {
      PVector mouse = new PVector(mouseX, mouseY);
      
      PVector rotAxis = PVector.sub(mouse, prevMouse).cross(new PVector(0.0, 0.0, 1.0)).normalize();
      float rotAngle = int(prevMouse.dist(mouse));
      
      ori.rot.setAngleAxis(radians(rotAngle), rotAxis);
      
      PVector rotV = PVector.sub(eye, center);
      eye = ori.rot.mult(rotV).add(center);
    }
    prevMouse.set(mouseX, mouseY);
  }
  
  void cam(PGraphics render)
  {
    render.camera(eye.x, eye.y, eye.z, center.x, center.y, center.z, up.x, up.y, up.z);
  }
  
  void set(PVector _eye, PVector _center, PVector _up)
  {
    eye = _eye;
    center = _center;
    up = _up;
    ori.pos = eye.copy();
  }
}
