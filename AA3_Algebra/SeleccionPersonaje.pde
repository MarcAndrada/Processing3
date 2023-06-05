Corve[] auxCorve;

float aux_x;
float aux_z;
int aux_point = 0;

void MenuPlayerSelect()
{
  
  background(100);
  
  background(100);
   hitlerCorve[0].DrawCorve();
  hitlerCorve[0].DrawControlPoitns();
  mussoliniCorve[0].DrawCorve();
  mussoliniCorve[0].DrawControlPoitns();
  abrahamLinconCorve[0].DrawCorve();
  abrahamLinconCorve[0].DrawControlPoitns();
  gandhiCorve[0].DrawCorve();
  gandhiCorve[0].DrawControlPoitns();
  
  
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
  
  fill(175, 175, 175);
  rect(150, 250, 200, 100);

  fill(0);
  textSize(20);
  text("HITLER", 220, 300);

  fill(175, 175, 175);
  rect(650, 250, 200, 100);

  fill(0);
  textSize(20);
  text("MUSOLINI",710 , 300);

  fill(175, 175, 175);
  rect(150, 500, 200, 100);

  fill(0);
  textSize(20);
  text("GANDI", 220, 550);

  fill(175, 175, 175);
  rect(650, 500, 200, 100);

  fill(0);
  textSize(20);
  text("ABRAM MATEO",690 ,550);

  fill(175, 175, 175);
  triangle(950, 40, 930, 30, 950, 20);

  PressPlayerSelect();
}

void PressPlayerSelect()
{
  
  
  if (mousePressed && (mouseButton==LEFT) && mouseX >= 150 && mouseX <= 350 && mouseY >= 250 && mouseY <= 350) 
  {
    println ("HITLER");

    menuCounter++;
    
      auxCorve[0] = hitlerCorve[0];
      auxCorve[0] = hitlerCorve[0];
    

  }
  else if(mousePressed && (mouseButton==LEFT) && mouseX >= 650 && mouseX <= 850 && mouseY >= 250 && mouseY <= 350)
  {
    println ("MUSOLINI");

    menuCounter++;
    
      auxCorve[0] = hitlerCorve[0];
      auxCorve[0] = hitlerCorve[0];
    
  } 
  else if(mousePressed && (mouseButton==LEFT) && mouseX >= 150 && mouseX <= 350 && mouseY >= 500 && mouseY <= 600)
  {
    println ("GANDI");

    menuCounter++;
    
      auxCorve[0] = hitlerCorve[0];
      auxCorve[0] = hitlerCorve[0];
    
  } 
  else if(mousePressed && (mouseButton==LEFT) && mouseX >= 650 && mouseX <= 850 && mouseY >= 500 && mouseY <= 600)
  {
    println ("ABRAM LINCON");

    menuCounter++;
    
      auxCorve[0] = hitlerCorve[0];
      auxCorve[0] = hitlerCorve[0];
    
  }
  else if( mousePressed && (mouseButton==LEFT) && mouseX >= 930 && mouseX <= 950 && mouseY >= 20 && mouseY <= 40)
  {
    menuCounter--;
  }
}
