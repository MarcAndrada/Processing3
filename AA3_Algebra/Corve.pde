class Corve
{
    PVector[] controlPoints;
    PVector[] coefficients;
    color corveColor;
    color pointsColor;
    int corveThickness;
    int totalPoints;

    Corve(PVector[] _controlPoints, int _thickness, int _totalPoints, color _curveColor, color _pointsColor){
        controlPoints = _controlPoints;
        corveColor = _curveColor;
        pointsColor = _pointsColor;
        corveThickness = _thickness;
        totalPoints = _totalPoints;
        
        CalculateCoefficients();

    }



    void CalculateCoefficients() 
    { // Solo se ejecuta al cambiar los puntos de control o al 

        if (isBezier)
        {
            coefficients = new PVector[4];
            coefficients[0] = new PVector();
            coefficients[1] = new PVector();
            coefficients[2] = new PVector();
            coefficients[3] = new PVector();
            //EQUACIONES DE BEZIER:
            // C0 = P0
            // C1 = -3P0 + 3P1
            // C2 = 3P0 - 6P1 + 3P2
            // C3 = -P0 + 3P1 - 3P2 + P3
            
            //Calcular la X
            coefficients[0].x = controlPoints[0].x;
            coefficients[1].x = -3 * controlPoints[0].x + 3 * controlPoints[1].x;
            coefficients[2].x = 3 * controlPoints[0].x - 6 * controlPoints[1].x + 3 * controlPoints[2].x;
            coefficients[3].x = -controlPoints[0].x + 3 * controlPoints[1].x - 3 * controlPoints[2].x + controlPoints[3].x;

            //Calcular la Y
            coefficients[0].z = controlPoints[0].z;
            coefficients[1].z = -3 * controlPoints[0].z + 3 * controlPoints[1].z;
            coefficients[2].z = 3 * controlPoints[0].z - 6 * controlPoints[1].z + 3 * controlPoints[2].z;
            coefficients[3].z = -controlPoints[0].z + 3 * controlPoints[1].z - 3 * controlPoints[2].z + controlPoints[3].z;
        }
        else
        {
            coefficients = new PVector[4];
            coefficients[0] = new PVector();
            coefficients[1] = new PVector();
            coefficients[2] = new PVector();
            coefficients[3] = new PVector();
             //Los coeficientes son:
            // C0 = P0
            // C1 = -5.5P0 + 9P1 -4.5P2 + P3
            // C2 = 9P0 - 22.5P1 + 18P2 - 4.5P3
            // C3 = -4.5 + 13.5P1 - 13.5P2 + 4.5P3

            //Calcular la X
            coefficients[0].x = controlPoints[0].x;
            coefficients[1].x = -5.5 * controlPoints[0].x + 9 * controlPoints[1].x - 4.5 * controlPoints[2].x + controlPoints[3].x;
            coefficients[2].x = 9 * controlPoints[0].x - 22.5 * controlPoints[1].x + 18 * controlPoints[2].x - 4.5 * controlPoints[3].x;
            coefficients[3].x = -4.5 * controlPoints[0].x + 13.5 * controlPoints[1].x - 13.5 * controlPoints[2].x + 4.5 * controlPoints[3].x;

            //Calcular la Z
            coefficients[0].z = controlPoints[0].z;
            coefficients[1].z = -5.5 * controlPoints[0].z + 9 * controlPoints[1].z - 4.5 * controlPoints[2].z + controlPoints[3].z;
            coefficients[2].z = 9 * controlPoints[0].z - 22.5 * controlPoints[1].z + 18 * controlPoints[2].z - 4.5 * controlPoints[3].z;
            coefficients[3].z = -4.5 * controlPoints[0].z + 13.5 * controlPoints[1].z - 13.5 * controlPoints[2].z + 4.5 * controlPoints[3].z;
        }
           
        
    }

    void DrawCorve()
    {
        fill(pointsColor);
        noStroke();
        float incrementU = 1/(float)totalPoints;

        for (float u = 0; u <= 1; u += incrementU) 
        {
            //Formula de los caluclos es :
            // p(u) = C0 + C1u + C2u2 + C3u3
            float x = coefficients[0].x + coefficients[1].x * u + coefficients[2].x * u * u + coefficients[3].x * u * u * u;
            float z = coefficients[0].z + coefficients[1].z * u + coefficients[2].z * u * u + coefficients[3].z * u * u * u;
            pushMatrix();
            translate(x, 450, z);
            sphere(corveThickness);
            popMatrix();
        }

    }

    void DrawControlPoitns()
    {
        noStroke();
        fill(corveColor);

        for (int i = 0; i < 4; i++) 
        {
            pushMatrix();
            translate(controlPoints[i].x, controlPoints[i].y ,controlPoints[i].z);
            sphere(corveThickness * 2);
            popMatrix();
        }

        
        //strokeWeight(corveThickness/2);
        //stroke(190,0,100);
        //line(controlPoints[0].x, controlPoints[0].y, controlPoints[1].x, controlPoints[1].y); 
        //line(controlPoints[0].x, controlPoints[0].y, controlPoints[2].x, controlPoints[2].y); 
        //line(controlPoints[1].x, controlPoints[1].y, controlPoints[3].x, controlPoints[3].y); 
        //line(controlPoints[2].x, controlPoints[2].y, controlPoints[3].x, controlPoints[3].y);
 


    }
}
