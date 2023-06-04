String userInput;
int value;

void MenuVariables()
{  
    background(255);

   // line(width/2, 0, width/2, height);

    fill(225);
    rect(450, 250, 100, 50);

    fill(0);
    text("Puntos",475 ,248);
    
    fill(225);
    rect(300, 500, 100, 50);

    fill(0);
    text("'X' value", 315, 498);

    fill(225);
    rect(600, 500, 100, 50);

    fill(0);
    text("'Z' value", 615, 498);

    fill(175, 175, 175);
    triangle(950, 40, 930, 30, 950, 20);
}



void PressVariablesMenu()
{
    if (mousePressed && (mouseButton==LEFT) && mouseX >= 930 && mouseX <= 950 && mouseY >= 20 && mouseY <= 40)
    {
        println ("Pito");
    }
    else if( mousePressed && (mouseButton==LEFT) && mouseX >= 930 && mouseX <= 950 && mouseY >= 20 && mouseY <= 40)
    {
        menuCounter--;
    }
}
