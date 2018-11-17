
class Planet
{
  PVector pos;
  int size = 30;
  Satellite st[];
  PVector lightDirection;
  PGraphics texture;
  PGraphics horiBlur;
  PGraphics vertBlur;
  
  Planet()
  {
    pos = new PVector(width/2, height/2, 0.0);
    st = new Satellite[] {
      new Satellite(),
      new Satellite(),
      new Satellite()
    };
    st[0].ori.pos.x = 100.0;
    st[0].offset.set(0, 1, 2);
    st[1].ori.pos.y = 200.0;
    st[0].offset.set(4, 5, 2);
    st[2].ori.pos.z = 150.0;
    st[0].offset.set(0, 75, 2);
    lightDirection = new PVector();

    texture = createGraphics(width, height, P3D);
    horiBlur = createGraphics(width, height, P3D);
    vertBlur = createGraphics(width, height, P3D);
  }
  
  void update(float t)
  {
    for(int i=0; i<st.length; i++)
    {
      st[i].update(t);
    }
    
    float divedT = t/2;
    lightDirection.set(1.0 + (noise(divedT)-.5), 1.0 + (noise(divedT+30)-.5), -1.0 + (noise(divedT-50)-.5));
  }
  
  void draw(PGraphics render)
  {
    texture.beginDraw();
    
    texture.noStroke();
    texture.pushMatrix();
    
    texture.lightFalloff(0, 0.005, 0.0);
    texture.directionalLight(255, 255, 255, lightDirection.x, lightDirection.y, lightDirection.z);
    
    texture.fill(#ffffff);
    texture.translate(pos.x, pos.y, pos.z);
    texture.sphere(size);
    
    for(int i=0; i<st.length; i++)
    {
      st[i].draw(texture);
    }
    texture.popMatrix();
    
    texture.endDraw();
    
    render.image(texture, 0, 0);
  }
}
