

class Bullet 
{

    PVector pos;
    PVector bulletDirection;
    float bulletSize = 3;
    float bulletSpeed = 0.02; 
    Team currentTeam;

    color  bulletColor = color(0,0,0);
    Bullet(PVector _pos, PVector _bulletDirection, Team _currTeam)
    {
           
        pos = new PVector(_pos.x, _pos.y, _pos.z);
        bulletDirection = new PVector(_bulletDirection.x - _pos.x, pos.y, _bulletDirection.z - _pos.z);
        currentTeam = _currTeam;
    }


    void Behaviour()
    {
        pos.x += bulletDirection.x * bulletSpeed;
        pos.z += bulletDirection.z * bulletSpeed;
        CheckCollision();
    }

    void CheckCollision()
    {
        switch(currentTeam)
        {
            case RED:
            case ORANGE:
            for(Soldier item : soldiers)
            {
                if(item.isAlive && item.currentTeam == Team.BLUE || item.isAlive && item.currentTeam == Team.GREEN)
                {
                    if(isColliding(pos, bulletSize,bulletSize, bulletSize, item.pos, item.m_width,  item.m_height, item.m_depth))
                    {
                        println("Le he dado a un comunista");
                        item.DealDamage();
                        //Destruir Bala
                        DestroyBullet();
                        return;
                    }
                }
            }

            if(gandhiCommander.isAlive && isColliding(pos, bulletSize,bulletSize, bulletSize, gandhiCommander.pos, gandhiCommander.m_width,  gandhiCommander.m_height, gandhiCommander.m_depth))
            {
                println("Le DI A GANDHI");
                gandhiCommander.DealDamage();
                //Destruir Bala
                DestroyBullet();
                return;
            }
            if(abrahamLinconCommander.isAlive && isColliding(pos, bulletSize,bulletSize, bulletSize, abrahamLinconCommander.pos, abrahamLinconCommander.m_width,  abrahamLinconCommander.m_height, abrahamLinconCommander.m_depth))
            {
                println("Le DI A LINCON");
                abrahamLinconCommander.DealDamage();
                //Destruir Bala
                DestroyBullet();
                return;
            }

            break;
            case BLUE:
            case GREEN:
            for(Soldier item : soldiers)
            {
                if(item.isAlive && item.currentTeam == Team.RED || item.isAlive && item.currentTeam == Team.ORANGE)
                {
                    if(isColliding(pos, bulletSize,bulletSize, bulletSize, item.pos, item.m_width,  item.m_height, item.m_depth))
                    {
                      println("Le he dado a un pibe bueno");
                        item.DealDamage();
                        //Destruir Bala
                        DestroyBullet();
                        return;
                    }
                }
                
            }

            if(hitlerCommander.isAlive && isColliding(pos, bulletSize,bulletSize, bulletSize, hitlerCommander.pos, hitlerCommander.m_width,  hitlerCommander.m_height, hitlerCommander.m_depth))
            {
                println("Le DI A HITLER");
                hitlerCommander.DealDamage();
                //Destruir Bala
                DestroyBullet();
                return;
            }

            if(mussoliniCommander.isAlive && isColliding(pos, bulletSize,bulletSize, bulletSize, mussoliniCommander.pos, mussoliniCommander.m_width,  mussoliniCommander.m_height, mussoliniCommander.m_depth))
            {
                println("Le DI A MUSSOLINI");
                mussoliniCommander.DealDamage();
                //Destruir Bala
                DestroyBullet();
                return;
            }
            break;
            default:
            break;
        }

        for (Scenari item : scenari)
        {
            if(item != floor && isColliding(pos, bulletSize,bulletSize, bulletSize, item.m_pos, item.m_width,  item.m_height, item.m_depth))
            {
                //Destruir Bala
                println("PUTA PARED PUTA PARED");
                DestroyBullet();
                return;
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
        box(bulletSize);
        popMatrix();

    }


}
