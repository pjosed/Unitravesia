PImage piso, escenario;
PImage menu[] = new PImage [5];
int xmenu = 0, ymenu = 0; // Posicion en x y de la imagen menú
boolean escena0 = true, escena1 = false, manual = false, creditos = false, personajes=false;
float xpos, ypos;
boolean izquierda = false, derecha = false;
float speed = 5;
float suelo = 300; // Posición del suelo
float gravedad = 2; // Gravedad constante
float saltoVelocidad = 75; // Velocidad inicial del salto
int gatoposx=600, gatoposy=300;
PImage botones[]= new PImage[3];
PImage personaje[]= new PImage[3];
String a= "";
String b= "";
int sz2=40;
int cl1=int(random(256));
int cl2=int(random(256)); 
int cl3=int(random(256));



void setup() {
  size(1200, 600);  
  
}

void draw() {
  
  if(escena0){
    sz2=sz2+15;
    cl1=cl1+10;
    cl2=cl2+10;
    cl3=cl3+10;
    
    if (sz2>width){    
      sz2=0;
    }
    if(cl1>256){
      cl1=0;
    } if(cl2>256){
      cl2=0;
    } if(cl3>256){
      cl3=0;
    }

  menu[0] = loadImage("Escenario.jpg"); 
  menu[0].resize(1200, 600);
  image(menu[0], xmenu, ymenu);
  
   botones[0]=loadImage("Boton_comenzar.png");
   botones[0].resize(width/3, 100);
   image(botones[0], xmenu, ymenu);
   
    botones[1]=loadImage("Boton_manual.png");
   botones[1].resize(width/3, 100);
   image(botones[1], width/3, ymenu);
   
    botones[2]=loadImage("Boton_creditos.png");
   botones[2].resize(width/3, 100);
   image(botones[2], width-width/3, ymenu);
   
   b= "UNITRAVESÍA";
   fill(cl1, cl2, cl3);
   textSize(100);
   text(b, sz2, height/2);
   
  }else if (escena1) { // Si está en la escena del videojuego
    escena1();
  } else if(personajes){
   personajes();
  }else if(manual){ // Si se muestra el manual
    manual();
  } else if (creditos){ // Se muestran los creditos
    creditos();
  }
}

void mousePressed() {
 
  if (escena0) { // Si está en la escena del menú
    if (mouseX > 0 && mouseX < 400 && mouseY > 0 && mouseY < 100) {
      escena0 = false;
      personajes = true;
    } else if (mouseX > 400 && mouseX < 800 && mouseY > 0 && mouseY < 100) {
      escena0 = false;
      manual = true;
    } else if (mouseX > 800 && mouseX < 1200 && mouseY > 0 && mouseY < 100) {
      escena0 = false;
      creditos = true;
    }
  }
}

void personajes(){
   cl1=cl1+10;
    cl2=cl2+10;
    cl3=cl3+10;
    if(cl1>256){
      cl1=0;
    } if(cl2>256){
      cl2=0;
    } if(cl3>256){
      cl3=0;
    }
    
   background(#FFFFFF);
  a= "Escoje con quien deseas jugar! :)";
 
  personaje[0]= loadImage("personajejose.png");
  personaje[1]= loadImage("personajealexander.png");
  personaje[2]= loadImage("personajesergio.png");
  
  
  image(personaje[0], 0, 0);
  image(personaje[1], width/3, 0);
  image(personaje[2], width-width/3, 15);
  piso = loadImage("Suelo.png");
  piso.resize(1200,300);
  image(piso, 0, suelo);
  text(a, 400, 440);
  textSize(34);
  fill(cl1, cl2, cl3);

  
}

void escena1() { ////////////////////////////////////////////////////////////// Escena del videojuego
frameRate(24);
  background(#FFFFFF);
   escenario= loadImage("Escenario.jpg"); 
   escenario.resize(1200,300);
  image(escenario,0, 0 );
  rect(0, suelo, 1200, 300);  
  piso = loadImage("Suelo.png");
  piso.resize(1200,300);
  image(piso, 0, suelo);
  rect(xpos, ypos+5, 20, 20);
  fill(#345BB9);
  ellipse(gatoposx, gatoposy, 40, 40);
  fill(#27D631);

  
if (gatoposx < 0) {
    gatoposx = width;
  }
  gatoposx -= 5;

  // Movimiento horizontal
  if (izquierda) {
    xpos -= speed;
  }
  if (derecha) {
    xpos += speed;
  }

  // Limitar laterales
  xpos = constrain(xpos, 0, width - 20);

  // Aplicar gravedad si no está en el suelo
  if (ypos < suelo) {
    ypos += gravedad;
  }

  // Evitar que se pase del suelo
  if (ypos > suelo) {
    ypos = suelo;
  }
}

void manual(){ ////////////////////////////////////////////////////////////////// MANUAL
  
  
}

void creditos(){ /////////////////////////////////////////////////////////////// CREDITOS
  
  
}

void keyPressed() {
  if (keyCode == 'A' || keyCode == 'a') {
    izquierda = true;
  } else if (keyCode == 'D' || keyCode == 'd') {
    derecha = true;
  } else if ((keyCode == 'W' || keyCode == 'w') && ypos == suelo) { // Saltar solo si está en el suelo
    ypos -= saltoVelocidad;
  }
}

void keyReleased() {
  if (keyCode == 'A' || keyCode == 'a') {
    izquierda = false;
  } else if (keyCode == 'D' || keyCode == 'd') {
    derecha = false;
  }
}
