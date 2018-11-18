import java.util.Queue;
import java.util.ArrayDeque;
import java.util.Iterator;

class Satellite
{
  int size = 10;
  PVector pos;
  Orientation ori;
  PVector offset;
  PVector euler;
  Queue<PVector> posHistory;
  int count;
  
  Satellite()
  {
    pos = new PVector();
    ori = new Orientation();
    offset = new PVector();
    euler = new PVector();
    posHistory = new ArrayDeque<PVector>();
    
    count = 0;
  }
  
  void update(float t)
  {
    float divedT = -t;
    euler.x += noise(divedT + offset.x) / 100.0;
    euler.y += noise(divedT + offset.y) / 100.0;
    euler.z += noise(divedT + offset.z) / 100.0;
    pos = ori.pos;
    
    if(posHistory.isEmpty())
    {
      for(int  i=0; i<70; i++)
      {
        posHistory.add(pos.copy());
      }
    }
    
    posHistory.add(rotateVectorFromEuler(pos, euler.x, euler.y, euler.z));
    posHistory.remove();
    
    count++;
  }
  
  void draw(PGraphics render)
  {
    render.pushMatrix();
    
    render.stroke(#73cac0);
    render.strokeWeight(1);
    render.noFill();
    render.beginShape();
    for(Iterator itr=posHistory.iterator(); itr.hasNext();)
    {
      PVector oldPos = (PVector)itr.next();
      render.vertex(oldPos.x, oldPos.y, oldPos.z);
    }
    render.endShape();
    
    render.fill(#4f99ca);
    render.noStroke();
    
    PVector p = rotateVectorFromEuler(pos, euler.x, euler.y, euler.z);
    render.translate(p.x, p.y, p.z);
    render.sphere(size);
    render.popMatrix();
  }
  
}
