

class Bullet 
{

    PVector pos;
    PVector bulletDirection;
    float bulletSize;
    float bulletSpeed;
    Team currentTeam;

    color  bulletColor = color(0);
    Bullet(PVector _pos, PVector _bulletDirection, Team _currTeam)
    {
        pos = _pos;
        bulletDirection = _bulletDirection;
        currentTeam = _currTeam;
    }


    void Behaviour()
    {
        pos.x += bulletDirection.x * bulletSpeed;
        pos.z += bulletDirection.z * bulletSpeed;

    }

    void CheckCollision()
    {
        switch(currentTeam)
        {
            case RED:
            case ORANGE:
            for(Soldier item : soldiers)
            {
                if(item.currentTeam == Team.BLUE || item.currentTeam == Team.GREEN)
                {
                    
                }
            }
            break;
            case BLUE:
            case GREEN:
            for(Soldier item : soldiers)
            {
                if(item.currentTeam == Team.RED || item.currentTeam == Team.ORANGE)
                {
                    
                }
            }
            break;
            default:
            break;
        }

        for (Scenari item : scenari)
        {
            if(isColliding(pos, bulletSize,bulletSize, bulletSize, item.m_pos, item.m_width,  item.m_height, item.m_depth))
            {
                //Destruir Bala
                
            }
        }
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

    void DestroyBullet()
    {
        bullets.remove(this);
    }



    void Draw()
    {
        fill(bulletColor);
        pushMatrix();
        translate(pos.x, pos.y, pos.z);
        sphere(bulletSize);
        popMatrix();

    }





}
