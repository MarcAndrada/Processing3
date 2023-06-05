
void CuadradosMenu()
{
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
  rect(400, 500, 200, 50);
  
  fill(175, 175, 175);
  rect(400, 565, 200, 50);

  fill(10);
  textSize(25);
  text("PLAY", 475, 530);


  fill(10);
  textSize(25);
  text("MOD RUTA", 455, 595);

  PressButton();
} 

 
void PressButton()
{
  if (mousePressed && (mouseButton==LEFT) && mouseX >= 400 && mouseX <= 600 && mouseY >= 500 && mouseY <= 550) 
  {
    menuCounter = 3; 
  }
  else if (mousePressed && (mouseButton==LEFT) && mouseX >= 400 && mouseX <= 600 && mouseY >= 565 && mouseY <= 615) 
  {
    menuCounter++;
  }
 
}