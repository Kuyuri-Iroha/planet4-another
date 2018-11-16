
class Planet
{
  PVector pos;
  int size = 30;
  Satellite st;
  Orientation stOrient;
  
  
  Planet()
  {
    pos = new PVector(width/2, height/2, 0.0);
    st = new Satellite();
    stOrient = new Orientation(new PVector(200.0, 0.0, 0.0), new Quaternion(radians(30), new PVector(0.0, 1.0, 0.0)));
  }
  
  void update()
  {
    st.update();
  }
  
  void draw()
  {
    noStroke();
    pushMatrix();
    
    fill(#ffffff);
    translate(pos.x, pos.y, pos.z);
    sphere(size);
    
    fill(#ff0000);
    stOrient.rot.setAngleAxis(radians((frameCount * 2)%360), new PVector(0.0, 0.0, 1.0));
    PVector tmpPos = stOrient.rot.mult(stOrient.pos);
    translate(tmpPos.x, tmpPos.y, tmpPos.z);
    println("("+tmpPos.x + ", " + tmpPos.y + ", " + tmpPos.z + ")");
    st.draw();
    popMatrix();
  }
}
