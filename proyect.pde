import gifAnimation.*;
PImage piso;
PImage []escenario = new PImage [4]; // posibles escenarios
PImage menu[] = new PImage [5];
int xmenu = 0, ymenu = 0; // Posicion en x y de la imagen menú
boolean escena0 = true,pregunta=false, escena1 = false, manual = false, creditos = false, personajes=false, escenarios=false, escenarios2=false, personajes2=false;
boolean personajes3=false, escena2=false;
float xpos, ypos=250, xpos2, ypos2=250;
boolean[] izquierda = new boolean[2];
boolean[] derecha = new boolean[2];
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
PImage pprincipal, psecundario; // personaje principal
Gif []corriendo;
PImage moneda;
float xmoneda = 1200, ymoneda= random(150, 300);
int speedmoneda=5;
String player1="1 JUGADOR", player2="2 JUGADORES";
String textopausa;
boolean pausa=false;

void setup() {
  size(1200, 600);
}

void draw() {

  if (escena0) { // Si está en el menú
    escena0();
  } if (escena1 & pausa==false) { // Si está en la escena del videojuego
    escena1();  
  } else if(pausa){
     pausa();
    } else if (escenarios) { // Si esta seleccionando el escenario
    escenario();
  } else if (pregunta) { // Si esta seleccionando el escenario
    pregunta();
  } else if (personajes) { // Si está en la seleccion del personaje
    personajes();
  } else if (personajes2) { // Si está en la seleccion del personaje el jugador 1
    personajes2();
  } else if (personajes3) { // Si está en la seleccion del personaje el jugador 2
    personajes3();
  } else if (escena2) { // Si está en la seleccion del personaje el jugador 2
    escena2();
  } else if (manual) { // Si se muestra el manual
    manual();
  } else if (creditos) { // Se muestran los creditos
    creditos();
  } else if(escenarios2){
    escenario2();
  }
}

void mousePressed() {
    println("X ES:", mouseX);
    println("Y ES:", mouseY);

  if (escena0) { // Si está en la escena del menú
    if (mouseX > 0 && mouseX < 400 && mouseY > 0 && mouseY < 100) {
      escena0 = false;
      pregunta = true;
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
      pregunta=true;
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
  
  }if (escenarios2) { // SI ESTOY EN EL MENU ESCENARIOS2
   if (mouseX>97 & mouseX<341 & mouseY>98 & mouseY<202) { // Escenario biblioteca
      escenarios2= false;
      personajes2=true;
      escprincipal= escenario[1];
    }else if (mouseX>473 & mouseX<714 & mouseY>299 & mouseY<401) { // Escenario Casa estudio
      escenarios2= false;
      personajes2=true;
      escprincipal= escenario[2];
    }else if (mouseX>800 & mouseX<1041 & mouseY>101 & mouseY<201) { // Escenario Bloque J
      escenarios2= false;
      personajes2=true;
      escprincipal= escenario[3];
    }else if (mouseX>1094 & mouseX<1157 & mouseY>10 & mouseY<61) { // VOY ATRAS
      escenarios2= false;
      pregunta=true;
    }
  
  }
  if (personajes) { // SI ESTOY SELECCIONANDO PERSONAJES EN UN JUGADOR
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
  if(personajes3){ /////////////////////////////////// SI EL JUGADOR 2 ESTÁ SELECCIONANDO PERSONAJES
     if (mouseX>34 & mouseX<124 & mouseY>50 & mouseY<290) { // SELECCIONAR PERSONAJE DE JOSE
      psecundario=personaje[0];
      personajes3= false;
      escena2=true;
      
     
    } else if (mouseX>420 & mouseX<519 & mouseY>50 & mouseY<290) { // SELECCIONAR PERSONAJE DE ALEXANDER
      psecundario=personaje[1];
      personajes3= false;
      escena2=true;
       
    } else if (mouseX>806 & mouseX<918 & mouseY>50 & mouseY<290) { // SELECCIONAR PERSONAJE DE SERGIO
      psecundario=personaje[2];
      personajes3= false;
      escena2=true;
     
    } else if (mouseX>1094 & mouseX<1157 & mouseY>10 & mouseY<61) { // IR ATRAS
      personajes3= false;
      personajes2=true;

    }
    
  }
  if(personajes2){ /////////////////////////////////// SI EL JUGADOR 1 ESTÁ SELECCIONANDO PERSONAJES
     if (mouseX>34 & mouseX<124 & mouseY>50 & mouseY<290) { // SELECCIONAR PERSONAJE DE JOSE
      personajes2= false;
      personajes3=true;
      pprincipal=personaje[0];
    } else if (mouseX>420 & mouseX<519 & mouseY>50 & mouseY<290) { // SELECCIONAR PERSONAJE DE ALEXANDER
      personajes2= false;
      personajes3=true;
      pprincipal=personaje[1];
    } else if (mouseX>806 & mouseX<918 & mouseY>50 & mouseY<290) { // SELECCIONAR PERSONAJE DE SERGIO
      personajes2= false;
      personajes3=true;
      pprincipal=personaje[2];
    } else if (mouseX>1094 & mouseX<1157 & mouseY>10 & mouseY<61) { // IR ATRAS
      personajes2= false;
      escenarios2=true;
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
  
  }
  if(pregunta){ ////////////////////////////////////////////////////////////SI ESTOY SELECCIONANDO 1 O 2 JUGADORES 
  
    if (mouseX>476 & mouseX<689 & mouseY>100 & mouseY<137) { //////////// 1 JUGADOR
      pregunta= false;
      escenarios=true;
    } else if (mouseX>466 & mouseX<723 & mouseY>263 & mouseY<308) { /////// 2 JUGADORES
      pregunta = false;
      escenarios2=true;   
    } else if (mouseX>1094 & mouseX<1157 & mouseY>10 & mouseY<61) { // VOY ATRAS
      pregunta= false;
      escena0=true;
    }
      
  }
}



void keyPressed() {

  if (escena1) {
    ////////// 1 JUGADOR ////////////////////7
    if (keyCode == 'A' || keyCode == 'a') {
      izquierda[0] = true;    
      //Añadir que el personaje corra hacia la izquierda añadiendo el gif o imagen
    } else if (keyCode == 'D' || keyCode == 'd') {
      derecha[0] = true;
      //Añadir que el personaje corra hacia la derecha añadiendo el gif o imagen
    } else if ((keyCode == 'W' || keyCode == 'w') && ypos == suelo) { // Saltar solo si está en el suelo
      ypos -= saltoVelocidad;
    }  if (keyCode=='p' | keyCode=='P'){
      pausa=!pausa;
    }
  }
  if(escena2){
    ///////////////JUGADOR 1///////////////////////
    if (keyCode == 'A' || keyCode == 'a') {
      izquierda[0] = true;    
      //Añadir que el personaje corra hacia la izquierda añadiendo el gif o imagen
    } if (keyCode == 'D' || keyCode == 'd') {
      derecha[0] = true;
      //Añadir que el personaje corra hacia la derecha añadiendo el gif o imagen
    } if ((keyCode == 'W' || keyCode == 'w') && ypos == suelo) { // Saltar solo si está en el suelo
      ypos -= saltoVelocidad;
    }
    //////////////JUGADOR 2///////////////////////
    if (keyCode == LEFT) {
      izquierda[1]=true;
    } if (keyCode == RIGHT) {
      derecha[1]=true;
    } if ((keyCode == UP) && ypos == suelo) { // Saltar solo si está en el suelo
      ypos2 -= saltoVelocidad;
    }
    if (keyCode=='p' | keyCode=='P'){
      pausa=!pausa;
    }
    
  }
}



void keyReleased() {
  if (escena1) { 
    ////////////// 1 JUGADOR ///////////////////////////
    if (keyCode == 'A' || keyCode == 'a') {
      izquierda[0] = false;
    } else if (keyCode == 'D' || keyCode == 'd') {
      derecha[0] = false;
    }
  }
  if(escena2){
    ///////////// JUGADOR 1////////////////
     if (keyCode == 'A' || keyCode == 'a') {
      izquierda[0] = false;
    } else if (keyCode == 'D' || keyCode == 'd') {
      derecha[0] = false;
    }
    //////////// JUGADOR 2 ///////////////////
    if (keyCode == LEFT) {
      izquierda[1]= false;
    } if (keyCode == RIGHT) {
      derecha[1] = false;
    }
  }
}
