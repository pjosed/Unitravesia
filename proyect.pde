import gifAnimation.*;
PImage piso;
PImage []escenario = new PImage [4]; // posibles escenarios
PImage menu[] = new PImage [5];
int xmenu = 0, ymenu = 0; // Posicion en x y de la imagen menú
boolean escena0 = true, escena1 = false, manual = false, creditos = false, personajes=false, escenarios=false;
float xpos, ypos=250;
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
String esc[]= new String[5]; // Textos de la pantalla escenario
int sz2=40;
int cl1=int(random(256)); // color r
int cl2=int(random(256)); // color g
int cl3=int(random(256)); // color b
PImage atras;
PImage credits;
PImage escprincipal; // Escenario principal
PImage pprincipal; // personaje principal
Gif []corriendo;

void setup() {
  size(1200, 600);
}



void draw() {

  if (escena0) { // Si está en el menú
    escena0();
  } else if (escena1) { // Si está en la escena del videojuego
    escena1();
  } else if (escenarios) {
    escenario();
  } else if (personajes) { // Si está en la seleccion del personaje
    personajes();
  } else if (manual) { // Si se muestra el manual
    manual();
  } else if (creditos) { // Se muestran los creditos
    creditos();
  }
}



void mousePressed() {
    println("X ES:", mouseX);
    println("Y ES:", mouseY);

  if (escena0) { // Si está en la escena del menú
    if (mouseX > 0 && mouseX < 400 && mouseY > 0 && mouseY < 100) {
      escena0 = false;
      escenarios = true;
    } else if (mouseX > 400 & mouseX < 800 && mouseY > 0 & mouseY < 100) {
      escena0 = false;
      manual = true;
    } else if (mouseX > 800 && mouseX < 1200 & mouseY > 0 && mouseY < 100) {
      escena0 = false;
      creditos = true;
    }
  }
  if (escenarios) { // SI ESTOY EN EL MENU ESCENARIOS
   if (mouseX>1094 & mouseX<1157 & mouseY>10 & mouseY<61) { // VOY ATRAS
      escenarios= false;
      escena0=true;
      escprincipal= escenario[1];
    }else if (mouseX>97 & mouseX<341 & mouseY>98 & mouseY<202) { // Escenario biblioteca
      escenarios= false;
      personajes=true;
      escprincipal= escenario[2];
    }else if (mouseX>473 & mouseX<714 & mouseY>299 & mouseY<401) { // Escenario Casa estudio
      escenarios= false;
      personajes=true;
      escprincipal= escenario[2];
    }else if (mouseX>800 & mouseX<1041 & mouseY>101 & mouseY<201) { // Escenario Bloque J
      escenarios= false;
      personajes=true;
      escprincipal= escenario[3];
    }
  
  }
  if (personajes) { // SI ESTOY SELECCIONANDO PERSONAJES
    if (mouseX>34 & mouseX<124 & mouseY>50 & mouseY<290) { // SELECCIONAR PERSONAJE DE JOSE
      personajes= false;
      escena1=true;
      pprincipal=personaje[0];
    } else if (mouseX>420 & mouseX<519 & mouseY>50 & mouseY<290) { // SELECCIONAR PERSONAJE DE ALEXANDER
      personajes= false;
      escena1=true;
      pprincipal=personaje[1];
    } else if (mouseX>806 & mouseX<918 & mouseY>50 & mouseY<290) { // SELECCIONAR PERSONAJE DE SERGIO
      personajes= false;
      escena1=true;
      pprincipal=personaje[2];
    } else if (mouseX>1094 & mouseX<1157 & mouseY>10 & mouseY<61) { // SELECCIONAR PERSONAJE DE SERGIO
      personajes= false;
      escenarios=true;
    }
  
  }
  if (creditos) {
    if (mouseX>1094 & mouseX<1157 & mouseY>10 & mouseY<61) { // VOY ATRAS
      creditos= false;
      escena0=true;
    } else if (mouseX>120 & mouseX<578 & mouseY>158 & mouseY<219) {
      link("https://www.alamy.es/puente-de-diversos-derechos-hombre-gente-saltando-stick-figura-stickman-pictograma-iconos-image214760025.html");
    } else if (mouseX>118 & mouseX<303 & mouseY>272 & mouseY<293) {
      link("https://co.pinterest.com/pin/431501208058226263/");
    } else if (mouseX>120 & mouseX<628 & mouseY>328 & mouseY<365) {
      link("https://www.shutterstock.com/es/image-vector/stickman-icon-stick-figure-man-person-2311274885");
    } else if (mouseX>118 & mouseX<621 & mouseY>423 & mouseY<469) {
      link("https://www.elparquedelosdibujos.com/dibujos/dibujos-de-animales/dibujos-de-gatos/dibujos-de-gatos.php");
    } else if (mouseX>114 & mouseX<626 & mouseY>516 & mouseY<542) {
      link("https://www.istockphoto.com/es/ilustraciones/iguana");
    } else if (mouseX>831 & mouseX<1024 & mouseY>310 & mouseY<368) {
      link("https://hoopgame.net/play/Sonic-the-Hedgehog");
    } else if (mouseX>715 & mouseX<1109 & mouseY>431 & mouseY<545) {
      link("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.es%2Ffotos-vectores-gratis%2Fpergamino&psig=AOvVaw1AkY8kXMf75bUwEn9a50jh&ust=1713975048870000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCIiJ_ePc2IUDFQAAAAAdAAAAABAE");
    }
    println ("X ES: ", mouseX);
    println ("Y ES: ", mouseY);
  }
}



void keyPressed() {

  if (escena1) {
    if (keyCode == 'A' || keyCode == 'a') {
      izquierda = true;    
      //Añadir que el personaje corra hacia la izquierda añadiendo el gif o imagen
    } else if (keyCode == 'D' || keyCode == 'd') {
      derecha = true;
      //Añadir que el personaje corra hacia la derecha añadiendo el gif o imagen
    } else if ((keyCode == 'W' || keyCode == 'w') && ypos == suelo) { // Saltar solo si está en el suelo
      ypos -= saltoVelocidad;
    }
  }
}



void keyReleased() {
  if (escena1) {
    if (keyCode == 'A' || keyCode == 'a') {
      izquierda = false;
    } else if (keyCode == 'D' || keyCode == 'd') {
      derecha = false;
    }
  }
}

void escena1() { ////////////////////////////////////////////////////////////// Escena del videojuego
  personaje[0].resize(200, 100);  
  personaje[1].resize(200, 100);  
  personaje[2].resize(200, 100);  
  escprincipal.resize(width, 400);
  background(#FFFFFF);   
  image(escprincipal, 0, 0 ); //Escenario
  piso = loadImage("Suelo.png"); // Piso
  piso.resize(1200, 400); // Piso
  image(piso, 0, suelo+50); // Piso
  
  image(pprincipal,xpos,ypos);  //Personaje
 
  
  fill(0);
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
void escena0() { ///////////////////////////////////////////////////7/MENU PRINCIPAL
  sz2=sz2+15;
  cl1=cl1+10;
  cl2=cl2+10;
  cl3=cl3+10;

  if (sz2>width) {
    sz2=0;
  }
  if (cl1>256) {
    cl1=0;
  }
  if (cl2>256) {
    cl2=0;
  }
  if (cl3>256) {
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
}


void creditos() { /////////////////////////////////////////////////////////////// CREDITOS
  credits = loadImage("creds.png");
  credits.resize(width, height);
  image(credits, 0, 0);
  atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
}



void escenario () { /////////////////////////////////////////// SELECCION DEL ESCENARIO
  escenario[0]= loadImage("Escenario.jpg");
  escenario[0].resize(width, height);
  background(escenario[0]);
  escenario[1]= loadImage("e11.png"); // Biblioteca
  escenario[1].resize(width/5, 100);
  image(escenario[1], 100, height/6);
  escenario[2]= loadImage("e22.png"); // Casa estudio
  escenario[2].resize(width/5, 100);
  image(escenario[2], 475, 300);
  escenario[3]= loadImage("e33.png"); // Bloque J
  escenario[3].resize(width/5, 100);
  image(escenario[3], 800, 100);
  esc[0]="Elige donde quieres jugar!!";
  esc[1]="Biblioteca";
  esc[2]="Casa estudio";
  esc[3]="Bloque J";
  textSize(20);
  fill(0);
  text(esc[0], 500, 20);
  fill(0);
  text(esc[1], 150, 250);
  fill(0);
  text(esc[2], 550, 450);
  fill(0);
  text(esc[3], 900, 250);
  atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
}
void personajes() {
  cl1=cl1+10;
  cl2=cl2+10;
  cl3=cl3+10;
  if (cl1>256) {
    cl1=0;
  }
  if (cl2>256) {
    cl2=0;
  }
  if (cl3>256) {
    cl3=0;
  }

  background(#FFFFFF);
  a= "Escoje con quien deseas jugar! :)";

  personaje[0]= loadImage("jose.png");
  personaje[1]= loadImage("alexander.png");
  personaje[2]= loadImage("sergio.png");
 
  image(personaje[0], 0, 0);
  image(personaje[1], width/3, 0);
  image(personaje[2], width-width/3, 15);
  piso = loadImage("Suelo.png");
  piso.resize(1200, 300);
  image(piso, 0, suelo);
  text(a, 400, 440);
  textSize(34);
  fill(cl1, cl2, cl3);
  atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
}

void manual() { ////////////////////////////////////////////////////////////////// MANUAL
}
