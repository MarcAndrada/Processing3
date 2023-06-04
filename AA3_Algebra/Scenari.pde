class Scenari
{
  //Los obstaculos son muy simples, simplemente tendremos una posicion donde esten ubicados, tamanyo y color
  PVector m_pos;
  float m_height;
  float m_width;
  float m_depth;
  float m_rotation;
  color m_color;

  Scenari(PVector _pos, float _width, float _height, float _depth, float _rotation, color _color)
  {
    m_pos = _pos;
    m_height = _height;
    m_width = _width;
    m_depth = _depth;
    m_rotation = _rotation;
    m_color = _color;
  }
  
  void Draw()
  {
    pushMatrix();
    strokeWeight(2);
    stroke(0);
    fill(m_color);
    translate(m_pos.x, groundYPos + m_pos.y - m_height / 2, m_pos.z);
    rotateY(radians(m_rotation));
    box(m_width, m_height, m_depth);
    popMatrix();
  }


}
