
class Planet
{
  PVector pos;
  int size = 30;
  Satellite st;
  Orientation stOrient;
  PVector nsOffset;
  PVector offTrans;
  
  
  Planet()
  {
    pos = new PVector(width/2, height/2, 0.0);
    st = new Satellite();
    stOrient = new Orientation(new PVector(200.0, 0.0, 0.0), new Quaternion(radians(30), new PVector(0.0, 1.0, 0.0)));
    nsOffset = new PVector(random(TAU), random(TAU), random(TAU));
    offTrans = new PVector(0.003, 0.02, 0.001);
  }
  
  void update()
  {
    PVector noisedAxis = new PVector(cos(nsOffset.x)*2-1, sin(nsOffset.y)*2-1, sin(nsOffset.z)*2-1);
    stOrient.rot.setAngleAxis(radians((frameCount * 1.8)%360), noisedAxis);
    st.pos = stOrient.rot.mult(stOrient.pos);
    st.update();
    
    nsOffset.add(offTrans);
  }
  
  void draw()
  {
    noStroke();
    pushMatrix();
    
    fill(#ffffff);
    translate(pos.x, pos.y, pos.z);
    sphere(size);
    
    fill(#ff0000);
//    println("("+tmpPos.x + ", " + tmpPos.y + ", " + tmpPos.z + ")");
    st.draw();
    popMatrix();
  }
}
