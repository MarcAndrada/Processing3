
void CuadradosMenu()
{
  background(255);

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
    
     camera(0, -2000, 0, 
    0, 0, 20,
    0, 1, 0);
  }
  else if (mousePressed && (mouseButton==LEFT) && mouseX >= 400 && mouseX <= 600 && mouseY >= 565 && mouseY <= 615) 
  {
    menuCounter++;
  }
 
}