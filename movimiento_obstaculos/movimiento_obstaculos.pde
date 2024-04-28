int xpers = 0;
int ypers = 300;
int speed = 5;
int suelo = 300;
int grav = 5;
int tiempot=0;//este es el contador del tiempo
int tiempoInicial;//esta variable es para lo saber cuando empieza el juego
int tiempoult;//esta variable es para validar cuando se aumenta la velocidad
int t=int(random(0, 2));//este es para ver hacia que lado baja el popo
int fotogramaInicial;//fotograma en el que empieza el juego
int poposuelo;//para ver el momento donde el popo toca el suelo
int frameAP=60;//es para ver cada cuando el popo aparece pero en termino de frames
int frameDP; //tiempo en el que desaparece el popo
boolean FI=true;//fotograma inicial cuando empieza el juego
boolean escena1=true;//este es el boleano de la escena del juego, cuando esto es verdadero, el contador de los segundos arranca
boolean escenafinal=false;//esto es boleano de la escena final que será verdadero cuando pasen 60 segundos
boolean jumping = false;
boolean rightKeyPressed = false;
boolean leftKeyPressed = false;
boolean swobstaculo=true;
boolean boleabomba=false;
PImage iguana;
PImage popo;
//de acá en adelante van las variables para que la iguana vaya de derecha a izquierda. Será jodido
int posición_inicial_iguana;//posicion random que aparecerá afuera de la ventana a la derecha
int xiguana=1300;//con esta variable haré que su aparición sea random
int yiguana=suelo-250;
int speedObs=8;
int xpopo;//pongo estos acá porque después no se definen
int ypopo=suelo-158;
boolean botar=true;
boolean boleaP=true;
boolean boleanobstaculo=true;
int s=int(random(200,800));

void setup() {
  size(1200, 600);
  background(100);
  tiempoInicial = millis();
  println(s);
}

void draw() {
  background(100);
  personaje();
  if(boleanobstaculo==true){
    obstaculo1();
  }
  movimiento();
  bomba();
  if(xiguana<=s && boleanobstaculo==true){
   boleabomba=true;
  }
  if(escena1==true){
    tiempo();
  }
  if(tiempoult==60){
    escenafinal=true;
    println(escenafinal);
  }
  
  if (boleabomba==false && t==2){
    t=int(random(0, 2));
  }
  reiniciar_arbol();
  println(boleanobstaculo);
  println(boleabomba);
}

void keyPressed() {
  if (keyCode == RIGHT) {
    rightKeyPressed = true;
  } else if (keyCode == LEFT) {
    leftKeyPressed = true;
  } else if (key == ' ' && !jumping) {
    jumping = true;
    ypers -= 200; // Salto
  }
}

void keyReleased() {
  if (keyCode == RIGHT) {
    rightKeyPressed = false;
  } else if (keyCode == LEFT) {
    leftKeyPressed = false;
  }
}

void movimiento() {
  // Movimiento horizontal
  if (rightKeyPressed==true) {
    xpers = xpers+ speed;
  } else if (leftKeyPressed) {
    xpers = xpers-speed;
  }
  
  // Aplicar gravedad
  if (ypers < suelo) {
    ypers =ypers+ grav;
  } else {
    ypers = suelo; // Asegurar que el personaje no atraviese el suelo
    jumping = false; // Detener el salto cuando toca el suelo
  }
  
  // Limitar la posición del personaje dentro del área de dibujo
  xpers = constrain(xpers, 0, width - 40);
}
void personaje() {
  fill(125);
  rect(xpers, ypers - 100, 40, 100);
}
void desplazamiento_obstaculo(){
  xiguana=xiguana-speed;
}
void obstaculo1() {
  desplazamiento_obstaculo();
  iguana=loadImage("ObsIguana.png");
  iguana.resize(150,275);
  image(iguana,xiguana,yiguana);
  if(xiguana<-175){
    boleanobstaculo=false;
    boleabomba=false;
  }
  //xpopo=xiguana+60;//
}
void bomba(){
  if (boleabomba==true && boleanobstaculo==true){
    popo=loadImage("popo.png");
    popo.resize(30,30);
    if(boleaP==true){
      xpopo=xiguana+60; 
      ypopo=suelo-158;
      boleaP=false;
    }
    image(popo,xpopo,ypopo);
    if (swobstaculo==true){
      if(t==0){
        xpopo=xpopo-speedObs;
        ypopo=ypopo+grav;
      }else if (t==1){
        xpopo=xpopo+speedObs;
        ypopo=ypopo+grav;
      }
      if(ypopo>=300){
        swobstaculo=false;
        poposuelo=frameCount;
        t=2;
      }
    }
    //después de ciertos fotogramas se deja de dibujar el popo
    if (swobstaculo==false && (frameCount)>=poposuelo+70){
      boleabomba=false;
      frameDP=frameCount;
      println(frameDP);
    }
  }
}
void reiniciar_arbol(){
  if( boleanobstaculo==false && boleabomba==false){
    xiguana=1300;
    boleanobstaculo=true;
    boleaP=true;
    swobstaculo=true;
  }
}
void tiempo(){
  tiempot = (millis() - tiempoInicial) / 1000;//millis da el tiempo en milisegundos, entonces debemos pasarlo a segundos restando el tiempo actual menos el inicial y dividir entre 1000
  // Muestra el tiempo transcurrido en segundos
  textSize(14);
  text("Tiempo: " + tiempot + " segundos", 40, 40);
  //aquí en este condicional si el tiempo actual al dividirlo entre 15, ver su rediduo y si se acerca a 0, entonces aumentamos nuestras variables de gravedad y velocidad.
  //además, actualizamos el último tiempo donde cambiamos la velocidad porque trabajamos con datos aproximados y debemos restringir más lo que entra al sí.
  if (tiempot % 15 < 0.1 && tiempoult!=tiempot){
    grav=grav+1;
    speed=speed+1;
    tiempoult=tiempot;
  }
}
void mouseClicked() {
  // Imprime las coordenadas x e y del clic del mouse en la consola
  println("Clic en posición: (" + mouseX + ", " + mouseY + ")");
}
