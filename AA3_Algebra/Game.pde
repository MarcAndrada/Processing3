
void Game()
{
  background(100);
  //Beahviours
  CommandersBehaviour();

  for (Soldier item : soldiers)
  {
    PVector destPos = new PVector(0, 0, 0);
    switch (item.currentTeam) {
    case RED :
      destPos = hitlerCommander.pos;
      break;	
    case ORANGE :
      destPos = mussoliniCommander.pos;
      break;	
    case BLUE :
      destPos = abrahamLinconCommander.pos;
      break;	
    case GREEN :
      destPos = gandhiCommander.pos;
      break;
    default :
      break;
      //menu
    }

    item.Behaviour(destPos);
  }

  hitlerCorve[0].DrawCorve();
  hitlerCorve[0].DrawControlPoitns();
  mussoliniCorve[0].DrawCorve();
  mussoliniCorve[0].DrawControlPoitns();
  abrahamLinconCorve[0].DrawCorve();
  abrahamLinconCorve[0].DrawControlPoitns();
  gandhiCorve[0].DrawCorve();
  gandhiCorve[0].DrawControlPoitns();

  CameraBehaviour();
  //if (menuCounter == 0)
  //{
  //  CuadradosMenu();
  //}
  //else if (menuCounter == 1)
  //{
  //  MenuPlayerSelect();
  //}
  //else if(menuCounter == 2)
  //{
  //  MenuVariables();
  //}
  //else if(menuCounter == 3)
  //{
  //  Game();
  //}

  if (!bullets.isEmpty()) {
    for (int i = 0; i< bullets.size(); i++)
    {
      bullets.get(i).Behaviour();
    }
  }

  //Draw
  DrawGrid();
  for (Scenari item : scenari)
  {
    item.Draw();
  }
  hitlerCommander.Draw();
  mussoliniCommander.Draw();
  gandhiCommander.Draw();
  abrahamLinconCommander.Draw();

  for (Soldier item : soldiers)
  {
    item.Draw();
  }

  if (!bullets.isEmpty()) {
    for (int i = 0; i< bullets.size(); i++)
    {
      bullets.get(i).Draw();
    }
  }
}
