float aux_x;
float aux_z;
int aux_point;

void MenuPlayerSelect()
{
  
  background(255);
  
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
    aux_x= hitlerCorve[0].controlPoints[0].x;
    aux_z= hitlerCorve[0].controlPoints[0].y;
  }
  else if(mousePressed && (mouseButton==LEFT) && mouseX >= 650 && mouseX <= 850 && mouseY >= 250 && mouseY <= 350)
  {
    println ("MUSOLINI");
    menuCounter++;
    aux_x= mussoliniCorve[0].controlPoints[0].x;
    aux_z= mussoliniCorve[0].controlPoints[0].y;
  } 
  else if(mousePressed && (mouseButton==LEFT) && mouseX >= 150 && mouseX <= 350 && mouseY >= 500 && mouseY <= 600)
  {
    println ("GANDI");
    menuCounter++;
    aux_x= gandhiCorve[0].controlPoints[0].x;
    aux_z= gandhiCorve[0].controlPoints[0].y;
  } 
  else if(mousePressed && (mouseButton==LEFT) && mouseX >= 650 && mouseX <= 850 && mouseY >= 500 && mouseY <= 600)
  {
    println ("ABRAM LINCON");
    menuCounter++;
    aux_x= abrahamLinconCorve[0].controlPoints[0].x;
    aux_z= abrahamLinconCorve[0].controlPoints[0].y;
  }
  else if( mousePressed && (mouseButton==LEFT) && mouseX >= 930 && mouseX <= 950 && mouseY >= 20 && mouseY <= 40)
  {
    menuCounter--;
  }
}
