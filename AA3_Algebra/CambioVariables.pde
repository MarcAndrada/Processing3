boolean isBezier;
int valueColor = 225;
int valueColor2 = 225;

void MenuVariables()
{  
    
    background(255);

   // line(width/2, 0, width/2, height);

    fill(225);
    rect(450, 250, 100, 50);
    Drawtext(aux_point, 465, 270);

    fill(0);
    text("Punto",475 ,248);
    
    fill(225);
    rect(300, 500, 100, 50);
    Drawtext(auxCorve[0].controlPoints[aux_point].x, 315, 530);

    fill(0);
    text("'X' value", 315, 498);

    fill(225);
    rect(600, 500, 100, 50);
    Drawtext(auxCorve[0].controlPoints[aux_point].z, 615, 530);

    fill(0);
    text("'Z' value", 615, 498);

    fill(175, 175, 175);
    triangle(950, 40, 930, 30, 950, 20);

    //punto
    fill(175);
    triangle(555, 260, 560, 250, 565, 260);

    fill(175);
    triangle(555, 270, 560, 280, 565, 270);

    //x value
    fill(175);
    triangle(405, 510, 410, 500, 415, 510);

    fill(175);
    triangle(405, 520, 410, 530, 415, 520);

    //z value
    fill(175);
    triangle(705, 510, 710, 500, 715, 510);

    fill(175);
    triangle(705, 520, 710, 530, 715, 520);

    fill(valueColor);
    rect(300, 850, 100, 50);
    fill(0);
    text("BEZIER", 320, 880);


    fill(valueColor2);
    rect(600, 850, 100, 50);
    fill(0);
    text("LINEAL", 620, 880);

}


void mouseClicked()
{
    if(  mouseX >= 930 && mouseX <= 950 && mouseY >= 20 && mouseY <= 40)
    {
        menuCounter--;
        if (menuCounter <= 0)
        {
            menuCounter = 0;
        }
    }

    else if( mouseX >= 555 && mouseX <= 565 && mouseY >=250 && mouseY <= 260)
    {
        aux_point++;
        if (aux_point >= 3)
         {
            aux_point = 3;
        }
    }

    else if( mouseX >= 555 && mouseX <= 565 && mouseY >=270 && mouseY <= 280)
    {
        aux_point--;
        if (aux_point <= 0)
        {
            aux_point = 0;
        }
    }

    else if( mouseX >= 405 && mouseX <= 415 && mouseY >=500 && mouseY <= 510)
    {
        auxCorve[0].controlPoints[aux_point].x++;
        auxCorve[0].CalculateCoefficients();
    }

    else if( mouseX >= 405 && mouseX <= 415 && mouseY >=520 && mouseY <= 530)
    {
        auxCorve[0].controlPoints[aux_point].x--;
        auxCorve[0].CalculateCoefficients();

    }

    else if( mouseX >= 705 && mouseX <= 715 && mouseY >=500 && mouseY <= 510)
    {
        auxCorve[0].controlPoints[aux_point].z++;
        auxCorve[0].CalculateCoefficients();

    }

    else if( mouseX >= 705 && mouseX <= 715 && mouseY >=520 && mouseY <= 530)
    {
        auxCorve[0].controlPoints[aux_point].z--;
        auxCorve[0].CalculateCoefficients();

    }
    else if(mouseX >= 300 && mouseX <= 400 && mouseY >=850 && mouseY <= 900)
    {
        isBezier = true;
        if (isBezier)
            valueColor = 190;
            valueColor2 = 225;
    }
    else if(mouseX >= 600 && mouseX <= 700 && mouseY >=850 && mouseY <= 900)
    {
        isBezier = false;
        
        if (!isBezier)
            valueColor2 = 190;
            valueColor = 225;
    }
    
}


void Drawtext(float _variable, float _x, float _y)
{
    fill(0);
    text(_variable, _x, _y);
}
