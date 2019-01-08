import java.util.Queue;
import java.util.ArrayDeque;
import java.util.Iterator;

class Satellite
{
  int size = 10;
  PVector initPos;
  Orientation ori;
  PVector offset;
  PVector euler;
  Queue<PVector> posHistory;
  int count;
  PVector startPos;
  PVector pos;
  boolean started;
  
  Satellite()
  {
    initPos = new PVector();
    ori = new Orientation();
    offset = new PVector();
    euler = new PVector();
    posHistory = new ArrayDeque<PVector>();
    startPos = new PVector();
    
    count = 0;
    started = false;
  }
  
  void update(float t)
  {
    float divedT = -t;
    euler.x += noise(divedT + offset.x) / 100.0;
    euler.y += noise(divedT + offset.y) / 100.0;
    euler.z += noise(divedT + offset.z) / 100.0;
    initPos = ori.pos;
    
    if(!started)
    {
      startPos = initPos.copy();
      started = true;
    }
    
    if(posHistory.isEmpty())
    {
      for(int  i=0; i<70; i++)
      {
        posHistory.add(initPos.copy());
      }
    }
    
    pos = rotateVectorFromEuler(initPos, euler.x, euler.y, euler.z);
    
    float interP = 1.0 - smoothstep(0.0, 0.1, t/8.0);
    if(interP <= 0.0)
    {
      interP = smoothstep(0.8, 1.0, t/8.0);
    }
    pos = PVector.lerp(pos, startPos, interP);
    
    posHistory.add(pos);
    posHistory.remove();
    
    count++;
  }
  
  void draw(PGraphics render)
  {
    render.pushMatrix();
    
    render.stroke(#73cac0);
    render.strokeWeight(1);
    render.noFill();
    /*
    render.beginShape();
    for(Iterator itr=posHistory.iterator(); itr.hasNext();)
    {
      PVector oldPos = (PVector)itr.next();
      render.vertex(oldPos.x, oldPos.y, oldPos.z);
    }
    render.endShape();
    */
    render.fill(#4f99ca);
    render.noStroke();
    
    render.translate(pos.x, pos.y, pos.z);
    render.sphere(size);
    render.popMatrix();
  }
  
}
