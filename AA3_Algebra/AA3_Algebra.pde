


void setup() 
{
    size(800,600, P3D);
}

void draw() 
{
    background(100);
    DrawScenari();
    CameraBehaviour();

}

void DrawScenari()
{
  //Definimos como se vera el escenario
  strokeWeight(1);
  stroke(255);
    //Hacemos un push en la matriz para volver atras despues dibujar todo el mapa
  pushMatrix();
  //El escenario estara posicionado en funcion del destino
  translate(0, 500, 0);

  float lineOffset = 50;

  //En este lo que haremos sera con un tamanyo maximo dibujaremos distintas lineas y las moveremos en x o z en cada itineracion del bucle
  for (int x=-2000; x<=2000; x+=lineOffset) {
    line( x, 0, -2000, x, 0, 2000 );
  }
  for (int z=-2000; z<=2000; z+=lineOffset) {
    line( -2000, 0, z, 2000, 0, z );
  }
  //Hacemos el POP para volver hacia atras
  popMatrix();
}


void keyPressed()
{
  //Comprobamos la entrada de todos los inputs

  if ( key == 'w' ) {
    camMovingForward = true;
  }

  if ( key == 's' ) {
    camMovingBack = true;
  }

  if ( key == 'a' ) {
    camMovingLeft = true;
  }

  if ( key == 'd' ) {
    camMovingRight = true;
  }


  if ( key == 'e' ) {
    camMovingDown = true;
  }

  if ( key == 'q' ) {
    camMovingUp = true;
  }


  if ( keyCode == PConstants.UP ) {
    camRotatingUp = true;
  }

  if ( keyCode == PConstants.DOWN ) {
    camRotatingDown = true;
  }

  if ( keyCode == PConstants.RIGHT ) {
    camRotatingRight = true;
  }

  if ( keyCode == PConstants.LEFT ) {
    camRotatingLeft = true;
  }
}

void keyReleased()
{
  //Comprobamos cuando soltamos todos los inputs

  if ( key == 'w' ) {
    camMovingForward = false;
  }

  if ( key == 's' ) {
    camMovingBack = false;
  }

  if ( key == 'a' ) {
    camMovingLeft = false;
  }

  if ( key == 'd' ) {
    camMovingRight = false;
  }


  if ( key == 'e' ) {
    camMovingDown = false;
  }
  if ( key == 'q' ) {
    camMovingUp = false;
  }


  if ( keyCode == PConstants.UP ) {
    camRotatingUp = false;
  }

  if ( keyCode == PConstants.DOWN ) {
    camRotatingDown = false;
  }

  if ( keyCode == PConstants.RIGHT ) {
    camRotatingRight = false;
  }

  if ( keyCode == PConstants.LEFT ) {
    camRotatingLeft = false;
  }

}