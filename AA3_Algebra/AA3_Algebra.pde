  
Scenari[] scenari;

//Variables del escenario
float gridSize = 50;
int totalGridSize = 2000;
float groundYPos = 500;
float wallHeigth = 150;
float fieldSizeX = 1200;
float fieldSizeZ = 500;
float marginOffset = 150;
float cornerSize = 450;
float cornerAngle = 40;
float secondaryAngle = 55;
float hallHeight = 80;
void setup()
{
  size(800, 600, P3D);
  InitializeScenari();
}

void InitializeScenari()
{
  scenari = new Scenari[30];
  //Limites X
  scenari[0] = new Scenari(new PVector(-fieldSizeX, 0, 0), gridSize, wallHeigth, fieldSizeZ - 80, 0, color(255));
  scenari[1] = new Scenari(new PVector(fieldSizeX, 0, 0), gridSize, wallHeigth, fieldSizeZ - 80, 0, color(255));
  //Limites Z
  scenari[2] = new Scenari(new PVector(0, 0, fieldSizeZ), fieldSizeX * 2 - 600, wallHeigth, gridSize, 0, color(255));
  scenari[3] = new Scenari(new PVector(0, 0, -fieldSizeZ), fieldSizeX * 2 - 600, wallHeigth, gridSize, 0, color(255));

  //Limites Torcidos derecha
  scenari[4] = new Scenari(new PVector(fieldSizeX - marginOffset, 0, fieldSizeZ - marginOffset), cornerSize, wallHeigth, gridSize, cornerAngle, color(255));
  scenari[5] = new Scenari(new PVector(fieldSizeX - marginOffset, 0, -fieldSizeZ + marginOffset), cornerSize, wallHeigth, gridSize, -cornerAngle, color(255));

  //Limites Torcidos derecha
  scenari[6] = new Scenari(new PVector(-fieldSizeX + marginOffset, 0, fieldSizeZ - marginOffset), cornerSize, wallHeigth, gridSize, -cornerAngle + 180, color(255));
  scenari[7] = new Scenari(new PVector(-fieldSizeX + marginOffset, 0, -fieldSizeZ + marginOffset), cornerSize, wallHeigth, gridSize, cornerAngle + 180, color(255));
  
  //Suelo
  scenari[8] = new Scenari(new PVector(0,-10,0), fieldSizeX * 2, -wallHeigth, fieldSizeZ * 2, 0, color(141,81,4));
  
  //Pasillos Verdes
  scenari[9] = new Scenari(new PVector(0, 0, 0), gridSize, hallHeight, fieldSizeX - ((fieldSizeX/8) * 2.5f), 0, color(0,255,0));
  //Pasillos Rojos
  scenari[10] = new Scenari(new PVector((fieldSizeX / 8) * 6, 0, (fieldSizeZ / 3)), 250, hallHeight, gridSize, cornerAngle, color(255,0,0));
  scenari[11] = new Scenari(new PVector((fieldSizeX / 8) * 6, 0, (-fieldSizeZ / 3)), 250, hallHeight, gridSize, -cornerAngle, color(255,0,0));
  scenari[12] = new Scenari(new PVector((fieldSizeX / 8) * 4, 0, 0), gridSize, hallHeight, 600, 0, color(255,0,0));
  scenari[13] = new Scenari(new PVector((fieldSizeX / 8) * 2, 0, (fieldSizeZ / 2)), 400, hallHeight, gridSize, -secondaryAngle, color(255,0,0));
  scenari[14] = new Scenari(new PVector((fieldSizeX / 8) * 2, 0, (-fieldSizeZ / 2)), 400, hallHeight, gridSize, secondaryAngle, color(255,0,0));
  //Pasillos Azules 
  scenari[15] = new Scenari(new PVector((-fieldSizeX / 8) * 6, 0, (fieldSizeZ / 3)), 250, hallHeight, gridSize, -cornerAngle , color(0,0,255));
  scenari[16] = new Scenari(new PVector((-fieldSizeX / 8) * 6, 0, (-fieldSizeZ / 3)), 250, hallHeight, gridSize, cornerAngle, color(0,0,255));
  scenari[17] = new Scenari(new PVector((-fieldSizeX / 8) * 4, 0, 0), gridSize, hallHeight, 600, 0, color(0,0,255));
  scenari[18] = new Scenari(new PVector((-fieldSizeX / 8) * 2, 0, (fieldSizeZ / 2)), 400, hallHeight, gridSize, secondaryAngle, color(0,0,255));
  scenari[19] = new Scenari(new PVector((-fieldSizeX / 8) * 2, 0, (-fieldSizeZ / 2)), 400, hallHeight, gridSize, -secondaryAngle, color(0,0,255));


}


void draw()
{
  background(100);
  DrawGrid();
  for (Scenari item : scenari)
  {
    if (item != null) {
      item.Draw();
    }
  }  
  CameraBehaviour();
}

void DrawGrid()
{

  //Hacemos un push en la matriz para volver atras despues dibujar todo el mapa
  pushMatrix();
  //El escenario estara posicionado en funcion del destino
  translate(0, groundYPos, 0);

  strokeWeight(1);
  stroke(255);
  //En este lo que haremos sera con un tamanyo maximo dibujaremos distintas lineas y las moveremos en x o z en cada itineracion del bucle
  for (int x=-totalGridSize; x<=totalGridSize; x+=gridSize) {
    line( x, 0, -totalGridSize, x, 0, totalGridSize );
  }
  for (int z=-totalGridSize; z<=totalGridSize; z+=gridSize) {
    line( -totalGridSize, 0, z, totalGridSize, 0, z );
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
