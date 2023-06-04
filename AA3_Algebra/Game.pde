
void Game()
{
  //pointLight(255, 255, 255, 0, 0, 0);

  background(100);
  //Beahviours
  CommandersBehaviour();

  for(Soldier item : soldiers)
  {
    PVector destPos = new PVector(0,0,0);
    switch (item.currentTeam) 
    {
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

    for(Soldier item : soldiers)
    {
      item.Draw();
    }
}
