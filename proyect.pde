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
