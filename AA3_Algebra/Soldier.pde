enum Team {BLUE, GREEN, RED, ORANGE};

class Soldier
{

  Team currentTeam;
  PVector pos;
  PVector vel;

  float weight;
  float m_height;
  float m_width;
  float m_depth;
  

  // KB de acercamiento a la bandada
  float KB;
  // KD de acercamiento a la meta
  float KD;
  //KC separacion de las colisiones
  float KC;
  color color_p;
  float maxSpeed;
  float dampingForce = 0.6f;

  boolean isCommander;


  int corveIndex;
  float corveIncrement;
  float corveSpeed = 0.04f;
  float minDistance = 30f;
  boolean isAlive;

  Soldier[] soldierSquad;

  Soldier(Team _currentTeam, PVector _pos, PVector _velocity, float _maxSpeed, float _weight, float _height, float _width, float _depht, color _color, float _KB, float _KD, Soldier[] _soldierSquad,  boolean _isCommander)
  {
    currentTeam = _currentTeam;
    pos =_pos;
    vel = _velocity;
    maxSpeed = _maxSpeed;
    weight = _weight;
    m_height = _height;
    m_width = _width;
    m_depth = _depht;
    color_p = _color;
    // Priodidades de la bandada de pajaros. Cuanto mas cerca de 1, mayor priodidad tendra
    KB = _KB; // Priodidad de seguir a la bandada
    KD = _KD; // Prioridad de seguir al objetivo
    KC = 30; // Prioridad de evitar colisiones

    soldierSquad = _soldierSquad;
    isCommander = _isCommander;
  }

  void Behaviour(PVector _destPos)
  {  
    //Moverse
    Move(_destPos);
    //Comprobar si disparar

    CheckIfReachedDestPoint(_destPos);

  }

  void Move(PVector _destPos)
  {
    PVector strenght = new PVector(0.0, 0.0, 0.0);
    PVector accel = new PVector(0.0, 0.0, 0.0);
    PVector dest = new PVector(0.0, 0.0, 0.0);
    //Flock es bandada
    PVector flock = new PVector(0.0, 0.0, 0.0);
    //El objeto con el que colisiona
    PVector collisionObject = CheckCollision();

    dest = UnitaryVector(pos, _destPos);

    flock = UnitaryVector(pos, FlockCenter(soldierSquad));
    //Definimos un nuevo vector para no sobreescibir el anterior vector con el valor del vector unitario
    PVector unitaryCollObj = UnitaryVector(pos, collisionObject);

    //En caso de que el vector inicial fuera un Vector 0
    if (collisionObject.x == 0 && collisionObject.z == 0)
    {
      //Haremos que el vector unitario tambien lo sea 
      //(utilizando la funcion de unitaryVector con un vector 0 me seguia dando valores y funcionaba mal el comportamiento)
      unitaryCollObj = new PVector(0, 0, 0);
    }

    //Aplicamos la fuerza teniendo en cuenta la constante del destino, la de la bandada y la de la colision
    strenght.x = KD * dest.x + KB * flock.x - KC * unitaryCollObj.x;
    strenght.z = KD * dest.z + KB * flock.z - KC * unitaryCollObj.z;

    //Aplicamos la friccion (damping)
    strenght.x += -dampingForce * vel.x;
    strenght.z += -dampingForce * vel.z;


    accel.x = strenght.x/weight;
    accel.z = strenght.z/weight;

    //Utilizamos la formula de Euler
    vel.x += accel.x * deltaTime;
    vel.z += accel.z * deltaTime;

    pos.x = pos.x + vel.x * deltaTime;
    pos.z = pos.z + vel.z * deltaTime;

  }

  PVector CheckCollision()
  {

    if (!isCommander)
    {
      if (isColliding(pos, m_width, m_height, m_depth, hitlerCommander.pos, hitlerCommander.m_width, hitlerCommander.m_height, hitlerCommander.m_depth)) //Si esta chocando con hitler
      {
        //Devolverle la posicion de el objeto encontrado
        return hitlerCommander.pos;
      }
      
      if (isColliding(pos, m_width, m_height, m_depth, mussoliniCommander.pos, mussoliniCommander.m_width, mussoliniCommander.m_height, mussoliniCommander.m_depth)) //Si esta chocando con mussolini
      {
        //Devolverle la posicion de el objeto encontrado
        return mussoliniCommander.pos;
      }
      
      if (isColliding(pos, m_width, m_height, m_depth, gandhiCommander.pos, gandhiCommander.m_width, gandhiCommander.m_height, gandhiCommander.m_depth)) //Si esta chocando con gandhi
      {
        //Devolverle la posicion de el objeto encontrado
        return gandhiCommander.pos;
      }
      
      if (isColliding(pos, m_width, m_height, m_depth, abrahamLinconCommander.pos, abrahamLinconCommander.m_width, abrahamLinconCommander.m_height, abrahamLinconCommander.m_depth)) //Si esta chocando con lincon
      {
          //Devolverle la posicion de el objeto encontrado
          return abrahamLinconCommander.pos;
      }

      for(Soldier item : soldiers)
      {    
        if (item != this && isColliding(pos, m_width, m_height, m_depth, item.pos,item.m_width, item.m_height, item.m_depth)) //Si esta chocando con algo y no somos nosotros mismos
        {
          //Devolverle la posicion de el objeto encontrado
          return item.pos;
        }
      }
    } //<>//

    for (Scenari item : scenari)
    {
      if (item != null && item != floor && isColliding(pos, m_width, m_height, m_depth, item.m_pos, item.m_width, item.m_height, item.m_depth)) //Si esta chocando con algo //<>// //<>//
      {
        //Devolverle la posicion de el objeto encontrado
        return item.m_pos;
      }
    }

    //Si no esta tocando nada devuelve un Vector 0 //<>// //<>// //<>//
    return new PVector(0, 0, 0);
  }

  boolean isColliding(PVector _p1, float _w1,float _h1, float _d1, PVector _p2, float _w2, float _h2, float _d2)
  {
    PVector maxP1Point = new PVector(_p1.x + _w1/2, _p1.y + _h1/2, _p1.z + _d1/2);
    PVector minP1Point = new PVector(_p1.x - _w1/2, _p1.y - _h1/2, _p1.z - _d1/2);

    PVector maxP2Point = new PVector(_p2.x + _w2/2, _p2.y + _h2/2, _p2.z + _d2/2);
    PVector minP2Point = new PVector(_p2.x - _w2/2, _p2.y - _h2/2, _p2.z - _d2/2);

    if (maxP1Point.x > minP2Point.x && maxP1Point.x < maxP2Point.x
    || minP1Point.x > minP2Point.x && minP1Point.x < maxP2Point.x)
    {
      if(maxP1Point.z > minP2Point.z && maxP1Point.z < maxP2Point.z 
      || minP1Point.z > minP2Point.z && minP1Point.z < maxP2Point.z)
      {
        println("Ha chocado");
        return true;
      }
    }



    return false;
  }

  void CheckIfReachedDestPoint(PVector _destPos)
  {
    if(isCommander){
    float dist = sqrt((pos.x * pos.x - _destPos.x * _destPos.x) + (pos.z * pos.z - _destPos.z * _destPos.z));
      if(dist <= minDistance){
        corveIncrement += corveSpeed;
        if(corveIncrement >= 1)
        {
          corveIncrement = 1;
          corveSpeed *= -1;
        }else if(corveIncrement <= 0)
        {
          corveIncrement = 0;
          corveSpeed *= -1;
        }
        println("Aumento");
      }
      println(dist);
    }
  }

  void Draw()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(color_p);
    strokeWeight(4);
    stroke(0);
    box(m_width, m_height, m_depth);
    popMatrix();


  }
}
sadasdasad