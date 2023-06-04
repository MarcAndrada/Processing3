
PVector[] pestañas = new PVector[4]; 
int menuCounter = 0;

void setup()
{
  size(1000, 1000);
  
}


void draw()
{
    if (menuCounter == 0) 
    { 
      CuadradosMenu();
    }
    else if (menuCounter == 1)
    {
      MenuPlayerSelect();
    }
    else if(menuCounter == 2)
    {
      MenuVariables();
    }
    else if(menuCounter == 3)
    {
      //GAME
    }
}
