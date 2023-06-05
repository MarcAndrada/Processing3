PVector[] pestañas = new PVector[4];
int menuCounter = 0;

ArrayList<Bullet> bullets;
float deltaTime = 0.08;

boolean usingBezier = true;


//Variables del escenario
Scenari[] scenari;

float gridSize = 50;
int totalGridSize = 2000;
float groundYPos = 500;
float wallHeigth = 150;
float fieldSizeX = 1200;
float fieldSizeZ = 500;
float marginOffset = 150;
float cornerSize = 450;
float cornerAngle = 40;
float hallHeight = 80;

Scenari floor;

//Variables de comandantes
Soldier hitlerCommander;
Soldier mussoliniCommander;

Soldier abrahamLinconCommander;
Soldier gandhiCommander;
float commandersSize = 20;

//Variables de soldados
int soldiersPerComander = 6;
float flockDestinyOffset = 30;
Soldier[] soldiers;
float soldiersSize = 15;
PImage hitlerImg;
PImage mussoliniImg;
PImage abrahamLinconImg;
PImage gandhiImg;
PImage soldierImg;


//Curvas
Corve[] hitlerCorve;
Corve[] mussoliniCorve;
Corve[] abrahamLinconCorve;
Corve[] gandhiCorve;

void setup()
{
  size(1000, 1000, P3D);
  bullets = new ArrayList<Bullet>();

  hitlerImg = loadImage("Hitler.jpg");
  mussoliniImg = loadImage("Mussolini.jpg");
  abrahamLinconImg = loadImage("Lincon.jpg");
  gandhiImg = loadImage("Gandhi.jpg");
  soldierImg = loadImage("Soldier.jpg");


  InitializeScenari();
  InitializeCorves();
  InitializeSoldiers();
  
  
  auxCorve = new Corve[1];
}

void InitializeScenari()
{
  scenari = new Scenari[20];
  // //Limites X
  scenari[0] = new Scenari(new PVector(-fieldSizeX, 0, 0), gridSize, wallHeigth, fieldSizeZ - 80, 0, color(255));
  scenari[1] = new Scenari(new PVector(fieldSizeX, 0, 0), gridSize, wallHeigth, fieldSizeZ - 80, 0, color(255));
  // //Limites Z
  scenari[2] = new Scenari(new PVector(0, 0, fieldSizeZ), fieldSizeX * 2 - 600, wallHeigth, gridSize, 0, color(255));
  scenari[3] = new Scenari(new PVector(0, 0, -fieldSizeZ), fieldSizeX * 2 - 600, wallHeigth, gridSize, 0, color(255));

  // //Limites Torcidos derecha
  scenari[4] = new Scenari(new PVector(fieldSizeX - marginOffset, 0, fieldSizeZ - marginOffset), cornerSize, wallHeigth, gridSize, cornerAngle, color(255));
  scenari[5] = new Scenari(new PVector(fieldSizeX - marginOffset, 0, -fieldSizeZ + marginOffset), cornerSize, wallHeigth, gridSize, -cornerAngle, color(255));

  // //Limites Torcidos derecha
  scenari[6] = new Scenari(new PVector(-fieldSizeX + marginOffset, 0, fieldSizeZ - marginOffset), cornerSize, wallHeigth, gridSize, -cornerAngle + 180, color(255));
  scenari[7] = new Scenari(new PVector(-fieldSizeX + marginOffset, 0, -fieldSizeZ + marginOffset), cornerSize, wallHeigth, gridSize, cornerAngle + 180, color(255));

  // //Suelo
  scenari[8] = new Scenari(new PVector(0, -10, 0), fieldSizeX * 2, -wallHeigth, fieldSizeZ * 2, 0, color(141, 81, 4));
  floor = scenari[8];

  // //Pasillos Verdes
  //scenari[9] = new Scenari(new PVector(0, 0, 0), gridSize, hallHeight, fieldSizeX - ((fieldSizeX/8) * 2.5f), 0, color(0, 255, 0));
  //Pasillos Rojos
  scenari[10] = new Scenari(new PVector((fieldSizeX / 8) * 6, 0, (fieldSizeZ / 3)), 250, hallHeight, gridSize, 0, color(255, 0, 0));
  scenari[11] = new Scenari(new PVector((fieldSizeX / 8) * 6, 0, (-fieldSizeZ / 3)), 250, hallHeight, gridSize, 0, color(255, 0, 0));
  //scenari[12] = new Scenari(new PVector((fieldSizeX / 8) * 4, 0, 0), gridSize, hallHeight, 600, 0, color(255, 0, 0));
  scenari[13] = new Scenari(new PVector((fieldSizeX / 8) * 2, 0, (fieldSizeZ / 2)), 400, hallHeight, gridSize, 0, color(255, 0, 0));
  scenari[14] = new Scenari(new PVector((fieldSizeX / 8) * 2, 0, (-fieldSizeZ / 2)), 400, hallHeight, gridSize, 0, color(255, 0, 0));
  //Pasillos Azules
  scenari[15] = new Scenari(new PVector((-fieldSizeX / 8) * 6, 0, (fieldSizeZ / 3)), 250, hallHeight, gridSize, 0, color(0, 0, 255));
  scenari[16] = new Scenari(new PVector((-fieldSizeX / 8) * 6, 0, (-fieldSizeZ / 3)), 250, hallHeight, gridSize, 0, color(0, 0, 255));
  //scenari[17] = new Scenari(new PVector((-fieldSizeX / 8) * 4, 0, 0), gridSize, hallHeight, 600, 0, color(0, 0, 255));
  scenari[18] = new Scenari(new PVector((-fieldSizeX / 8) * 2, 0, (fieldSizeZ / 2)), 400, hallHeight, gridSize, 0, color(0, 0, 255));
  scenari[19] = new Scenari(new PVector((-fieldSizeX / 8) * 2, 0, (-fieldSizeZ / 2)), 400, hallHeight, gridSize, 0, color(0, 0, 255));
}

void InitializeSoldiers()
{
  hitlerCommander = new Soldier(Team.RED, new PVector(hitlerCorve[0].controlPoints[0].x - 10, hitlerCorve[0].controlPoints[0].y, hitlerCorve[0].controlPoints[0].z - 10), new PVector(), 200f, 60f, commandersSize, commandersSize, commandersSize, hitlerImg, 0.1f, 10, soldiers, true, 20);
  mussoliniCommander = new Soldier(Team.ORANGE, new PVector(mussoliniCorve[0].controlPoints[0].x - 10, mussoliniCorve[0].controlPoints[0].y, mussoliniCorve[0].controlPoints[0].z - 10), new PVector(), 5f, 60f, commandersSize, commandersSize, commandersSize, mussoliniImg, 0.1f, 10, soldiers, true, 20);
  abrahamLinconCommander = new Soldier(Team.BLUE, new PVector(abrahamLinconCorve[0].controlPoints[0].x - 10, abrahamLinconCorve[0].controlPoints[0].y, abrahamLinconCorve[0].controlPoints[0].z - 10), new PVector(), 5f, 60f, commandersSize, commandersSize, commandersSize, abrahamLinconImg, 0.1f, 10, soldiers, true, 20);
  gandhiCommander = new Soldier(Team.GREEN, new PVector(gandhiCorve[0].controlPoints[0].x - 10, gandhiCorve[0].controlPoints[0].y, gandhiCorve[0].controlPoints[0].z - 10), new PVector(), 5f, 60f, commandersSize, commandersSize, commandersSize, gandhiImg, 0.1f, 10, soldiers, true, 20);

  soldiers = new Soldier[soldiersPerComander * 4];
  Soldier[] hitlerSoldiers =  new Soldier[soldiersPerComander];
  for (int i = 0; i < soldiers.length/4; i++)
  {
    float kb = random(3, 10);
    float kd = random(6, 10);
    PVector spawnPos = new PVector(hitlerCommander.pos.x + random(-10, 11), hitlerCommander.pos.y, hitlerCommander.pos.z + random(-10, 11));
    soldiers[i] = new Soldier(Team.RED, spawnPos, new PVector(), random(7.5f, 12.5f), random(40, 60), soldiersSize, soldiersSize, soldiersSize, soldierImg, kb, kd, soldiers, false, 10);
    hitlerSoldiers[i] = soldiers[i];
  }


  Soldier[] mussoliniSoldiers =  new Soldier[soldiersPerComander];
  for (int i = soldiers.length/4; i < soldiers.length/4 * 2; i++)
  {
    float kb = random(3, 10);
    float kd = random(6, 10);
    PVector spawnPos = new PVector(mussoliniCommander.pos.x + random(-10, 11), mussoliniCommander.pos.y, mussoliniCommander.pos.z + random(-10, 11));
    soldiers[i] = new Soldier(Team.ORANGE, spawnPos, new PVector(), random(7.5f, 12.5f), random(40, 60), soldiersSize, soldiersSize, soldiersSize, soldierImg, kb, kd, soldiers, false, 10);
    mussoliniSoldiers[i%soldiersPerComander] = soldiers[i];
  }

  Soldier[] gandhiSoldiers =  new Soldier[soldiersPerComander];
  for (int i = soldiers.length/4 * 2; i < soldiers.length/4 * 3; i++)
  {
    float kb = random(3, 10);
    float kd = random(6, 10);
    PVector spawnPos = new PVector(gandhiCommander.pos.x + random(-10, 11), gandhiCommander.pos.y, gandhiCommander.pos.z + random(-10, 11));
    soldiers[i] = new Soldier(Team.GREEN, spawnPos, new PVector(), random(7.5f, 12.5f), random(40, 60), soldiersSize, soldiersSize, soldiersSize, soldierImg, kb, kd, soldiers, false, 10);
    gandhiSoldiers[i%soldiersPerComander] = soldiers[i];
  }

  Soldier[] abrahamLinconSoldiers =  new Soldier[soldiersPerComander];
  for (int i = soldiers.length/4 * 3; i < soldiers.length; i++)
  {
    float kb = random(3, 10);
    float kd = random(6, 10);
    PVector spawnPos = new PVector(abrahamLinconCommander.pos.x + random(-10, 11), abrahamLinconCommander.pos.y, abrahamLinconCommander.pos.z + random(-10, 11));
    soldiers[i] = new Soldier(Team.BLUE, spawnPos, new PVector(), random(7.5f, 12.5f), random(40, 60), soldiersSize, soldiersSize, soldiersSize, soldierImg, kb, kd, soldiers, false, 10);
    abrahamLinconSoldiers[i%soldiersPerComander] = soldiers[i];
  }

  hitlerCommander.soldierSquad = hitlerSoldiers;
  mussoliniCommander.soldierSquad = mussoliniSoldiers;
  abrahamLinconCommander.soldierSquad = abrahamLinconSoldiers;
  gandhiCommander.soldierSquad = gandhiSoldiers;

  for (int i = 0; i < soldiers.length/4; i++)
  {
    soldiers[i].soldierSquad = hitlerSoldiers;
  }

  for (int i = soldiers.length/4; i < soldiers.length/4 * 2; i++)
  {
    soldiers[i].soldierSquad = mussoliniSoldiers;
  }

  for (int i = soldiers.length/4 * 2; i < soldiers.length/4 * 3; i++)
  {
    soldiers[i].soldierSquad = gandhiSoldiers;
  }

  for (int i = soldiers.length/4 * 3; i < soldiers.length; i++)
  {
    soldiers[i].soldierSquad = abrahamLinconSoldiers;
  }
}

void InitializeCorves()
{
  hitlerCorve = new Corve[1];
  PVector[] points = new PVector[4];

  color corveColor = color(255, 0, 0);
  color pointsColor = color(153, 0, 0);
  int corveThickness = 3;
  int totalPoints = 30;

  //Inicializar puntos de curva 1
  points[0] = new PVector(fieldSizeX - fieldSizeX/8, 450, -fieldSizeZ/2);
  points[1] = new PVector(fieldSizeX - fieldSizeX/2, 450, -fieldSizeZ/2);
  points[2] = new PVector(-fieldSizeX + fieldSizeX/2, 450, fieldSizeZ/2);
  points[3] = new PVector(-fieldSizeX + fieldSizeX/8, 450, fieldSizeZ/2);
  //Inicializar curva 1
  hitlerCorve[0] = new Corve(points, corveThickness, totalPoints, corveColor, pointsColor);

  PVector[] points2 = new PVector[4];

  mussoliniCorve = new Corve[1];

  corveColor = color(255, 102, 0);
  pointsColor = color(153, 61, 0);

  //Inicializar puntos de curva 2
  points2[0] = new PVector(fieldSizeX - fieldSizeX/8, 450, fieldSizeZ/2);
  points2[1] = new PVector(fieldSizeX - fieldSizeX/4, 450, fieldSizeZ/2);
  points2[2] = new PVector(0, 450, fieldSizeZ/2);
  points2[3] = new PVector(-fieldSizeX - fieldSizeX/4, 450, -fieldSizeZ/2);
  //Inicializar curva 2
  mussoliniCorve[0] = new Corve(points2, corveThickness, totalPoints, corveColor, pointsColor);


  PVector[] points3 = new PVector[4];

  abrahamLinconCorve = new Corve[1];

  corveColor = color(0, 0, 255);
  pointsColor = color(0, 0, 153);

  //Inicializar puntos de curva 3
  points3[0] = new PVector(-fieldSizeX + fieldSizeX/8, 450, fieldSizeZ/2);
  points3[1] = new PVector(-fieldSizeX + fieldSizeX/2, 450, fieldSizeZ/2);
  points3[2] = new PVector( fieldSizeX - fieldSizeX/2 , 450, -fieldSizeZ/2);
  points3[3] = new PVector( fieldSizeX - fieldSizeX/8, 450, -fieldSizeZ/2);
  //Inicializar curva 3
  abrahamLinconCorve[0] = new Corve(points3, corveThickness, totalPoints, corveColor, pointsColor);


  PVector[] points4 = new PVector[4];

  gandhiCorve = new Corve[1];

  corveColor = color(0, 255, 0);
  pointsColor = color(0, 153, 0);

  
  //Inicializar puntos de curva 4
  points4[0] = new PVector(-fieldSizeX + fieldSizeX/8, 450, -fieldSizeZ/2);
  points4[1] = new PVector(-fieldSizeX + fieldSizeX/4, 450, -fieldSizeZ/2);
  points4[2] = new PVector(0, 450, fieldSizeZ/2);
  points4[3] = new PVector(fieldSizeX + fieldSizeX/4, 450, fieldSizeZ/2);

  //Inicializar curva 4
  gandhiCorve[0] = new Corve(points4, corveThickness, totalPoints, corveColor, pointsColor);
}

void draw()
{
  if (menuCounter == 0)
  {
   CuadradosMenu();
  }
  else if (menuCounter == 1)
  {
   MenuPlayerSelect();
  }
  else if(menuCounter == 2)
  {
   MenuVariables();
  }
  else if(menuCounter == 3)
  {
   Game();
  }
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

void CommandersBehaviour()
{
  //Comandante 1
  float x = hitlerCorve[0].coefficients[0].x +
    hitlerCorve[0].coefficients[1].x * hitlerCommander.corveIncrement +
    hitlerCorve[0].coefficients[2].x * hitlerCommander.corveIncrement * hitlerCommander.corveIncrement +
    hitlerCorve[0].coefficients[3].x * hitlerCommander.corveIncrement * hitlerCommander.corveIncrement * hitlerCommander.corveIncrement;
  float z = hitlerCorve[0].coefficients[0].z +
    hitlerCorve[0].coefficients[1].z * hitlerCommander.corveIncrement +
    hitlerCorve[0].coefficients[2].z * hitlerCommander.corveIncrement * hitlerCommander.corveIncrement +
    hitlerCorve[0].coefficients[3].z * hitlerCommander.corveIncrement * hitlerCommander.corveIncrement * hitlerCommander.corveIncrement;

  hitlerCommander.Behaviour(new PVector(x, hitlerCommander.pos.y, z));


  pushMatrix();
  translate(x, hitlerCommander.pos.y, z);
  fill(0);
  noStroke();
  sphere(3);
  popMatrix();



  //Comandante 2
  x = mussoliniCorve[0].coefficients[0].x +
    mussoliniCorve[0].coefficients[1].x * mussoliniCommander.corveIncrement +
    mussoliniCorve[0].coefficients[2].x * mussoliniCommander.corveIncrement * mussoliniCommander.corveIncrement +
    mussoliniCorve[0].coefficients[3].x * mussoliniCommander.corveIncrement * mussoliniCommander.corveIncrement * mussoliniCommander.corveIncrement;
  z = mussoliniCorve[0].coefficients[0].z +
    mussoliniCorve[0].coefficients[1].z * mussoliniCommander.corveIncrement +
    mussoliniCorve[0].coefficients[2].z * mussoliniCommander.corveIncrement * mussoliniCommander.corveIncrement +
    mussoliniCorve[0].coefficients[3].z * mussoliniCommander.corveIncrement * mussoliniCommander.corveIncrement * mussoliniCommander.corveIncrement;

  mussoliniCommander.Behaviour(new PVector(x, hitlerCommander.pos.y, z));
  pushMatrix();
  translate(x, mussoliniCommander.pos.y, z);
  fill(0);
  noStroke();
  sphere(3);
  popMatrix();

  //Comandante 3
  x = abrahamLinconCorve[0].coefficients[0].x +
    abrahamLinconCorve[0].coefficients[1].x * abrahamLinconCommander.corveIncrement +
    abrahamLinconCorve[0].coefficients[2].x * abrahamLinconCommander.corveIncrement * abrahamLinconCommander.corveIncrement +
    abrahamLinconCorve[0].coefficients[3].x * abrahamLinconCommander.corveIncrement * abrahamLinconCommander.corveIncrement * abrahamLinconCommander.corveIncrement;
  z = abrahamLinconCorve[0].coefficients[0].z +
    abrahamLinconCorve[0].coefficients[1].z * abrahamLinconCommander.corveIncrement +
    abrahamLinconCorve[0].coefficients[2].z * abrahamLinconCommander.corveIncrement * abrahamLinconCommander.corveIncrement +
    abrahamLinconCorve[0].coefficients[3].z * abrahamLinconCommander.corveIncrement * abrahamLinconCommander.corveIncrement * abrahamLinconCommander.corveIncrement;

  abrahamLinconCommander.Behaviour(new PVector(x, hitlerCommander.pos.y, z));
  pushMatrix();
  translate(x, abrahamLinconCommander.pos.y, z);
  fill(0);
  noStroke();
  sphere(3);
  popMatrix();


  //Comandante 4
  x = gandhiCorve[0].coefficients[0].x +
    gandhiCorve[0].coefficients[1].x * gandhiCommander.corveIncrement +
    gandhiCorve[0].coefficients[2].x * gandhiCommander.corveIncrement * gandhiCommander.corveIncrement +
    gandhiCorve[0].coefficients[3].x * gandhiCommander.corveIncrement * gandhiCommander.corveIncrement * gandhiCommander.corveIncrement;
  z = gandhiCorve[0].coefficients[0].z +
    gandhiCorve[0].coefficients[1].z * gandhiCommander.corveIncrement +
    gandhiCorve[0].coefficients[2].z * gandhiCommander.corveIncrement * gandhiCommander.corveIncrement +
    gandhiCorve[0].coefficients[3].z * gandhiCommander.corveIncrement * gandhiCommander.corveIncrement * gandhiCommander.corveIncrement;

  gandhiCommander.Behaviour(new PVector(x, hitlerCommander.pos.y, z));

  pushMatrix();
  translate(x, gandhiCommander.pos.y, z);
  fill(0);
  noStroke();
  sphere(3);
  popMatrix();
}

//MATH FUNCTIONS
PVector UnitaryVector(PVector start, PVector end)
{
  PVector result = new PVector(0, 0, 0);


  result.x = end.x - start.x;
  result.y = end.y - start.y;
  result.z = end.z - start.z;

  float mod = sqrt(result.x * result.x + result.y * result.y + result.z * result.z );
  result.x /= mod;
  result.y /= mod;
  result.z /= mod;


  return result;
}

PVector FlockCenter(Soldier[] _soldierFlock)
{
  PVector result;
  result = new PVector(0.0, 0.0, 0.0);
  int flockAlive = _soldierFlock.length;
  for (int i = 0; i < _soldierFlock.length; i++)
  {
    if (_soldierFlock[i].isAlive)
    {
      result.x += _soldierFlock[i].pos.x;
      result.y += _soldierFlock[i].pos.y;
      result.z += _soldierFlock[i].pos.z;
    } else
    {
      flockAlive--;
    }
  }

  result.x /= flockAlive;
  result.y /= flockAlive;
  result.z /= flockAlive;


  return result;
}

float GetDistance(PVector _p1, PVector _p2)
{
  float dist = sqrt((_p1.x * _p1.x - _p2.x * _p2.x) + (_p1.z * _p1.z - _p2.z * _p2.z));
  println(dist);
  if (dist < 0)
    dist *= -1;
  return dist;
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
