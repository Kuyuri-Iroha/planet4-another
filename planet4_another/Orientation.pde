
class Orientation
{
  PVector pos;
  Quaternion rot;
  
  Orientation()
  {
    pos = new PVector();
    rot = new Quaternion();
  }
  
  Orientation(PVector _pos, Quaternion _quat)
  {
    pos = _pos;
    rot = _quat;
  }
  
  PVector move(PVector normalizedDir)
  {
    return new PVector(normalizedDir.x * pos.x, normalizedDir.y * pos.y, normalizedDir.z * pos.z);
  }
}
