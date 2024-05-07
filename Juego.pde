float suelo = 480; // Posición del suelo
PImage CantAgua;


class Escena_Juego { ////////////////////////////////////////////////////////////// Escena del videojuego

  PImage corazon;
  int UlFoto=0;
  int vidas=3;
  ArrayList<Jugador>  Jugadores = new ArrayList<Jugador>();
  Coin coin;
  PImage CountAguas;
  Obstaculos obstaculosEscena = new Obstaculos();
  boolean pausa = false;
  PImage Escenario;
  float suelo = 480; // Posición del suelo

  int TiempoInicio;
  int TiempoTranscurrido;
  boolean  boleaColision=false;
  
  int Tiempo_Pausa ;
  int Tiempo_Pausa_Inicio=0;

  // Setter para la variable "personaje"





  void draw () {

    if (pausa == false) {


      background(255);

      image(Escenario, 0, 0 ); //Escenario
      image(piso, 0, 450); // Piso

      obstaculosEscena.draw();

      for (int j =0; j < Jugadores.size(); j++) {//Preguntar por cada jugador

        coin.TomoAgua(Jugadores.get(j).xpos, Jugadores.get(j).Width_Personaje_Principal, Jugadores.get(j).ypos, Jugadores.get(j).Height_Personaje_Principal);

        if (obstaculosEscena.Chocaron(Jugadores.get(j).xpos, Jugadores.get(j).Width_Personaje_Principal, Jugadores.get(j).ypos, Jugadores.get(j).Height_Personaje_Principal, this.boleaColision)) {

          this.vidas=vidas-1;
          UlFoto=frameCount;

          this.vidas=this.vidas-1;
          this.UlFoto=frameCount;

          boleaColision=true;
          ColisionRec=true;
      ColisionPlaying=false;
          ColisionSonido();
    ColisionRec=false;
          
        }
        Jugadores.get(j).draw();
      }

      /*for(int j =0; j < Jugadores.size() ; j++){//Preguntar por cada Jugador si tomo agua
       coin.TomoAgua(Jugadores.get(j).xpos,Jugadores.get(j).Width_Personaje_Principal,Jugadores.get(j).ypos,Jugadores.get(j).Height_Personaje_Principal);
       }*/

      if (frameCount-UlFoto>=40) {
        boleaColision=false;
      }
      //aquí verá cuando se acaben las 3 vidas
      if (this.vidas==0) {
        println(name_to_score);
        S_Scores.actualizar(name_to_score,this.coin.coinsRecaudadas);
        
        
        textSize(32);
        fill(255, 0, 0);
        text("¡GAME OVER! :(", width/2 - 150, height/2);
         fill(255,255, 255);
        text("Para reiniciar oprime R", width/2 - 150, suelo-30);
        text("Para terminar oprime K", width/2 - 150, suelo);
        Escena1=false;
        Recovery = true;
        
      } 




      /////// hasta aqui escenario y persona

      this.TiempoInicio = this.TiempoInicio + this.Tiempo_Pausa;
      this.Tiempo_Pausa =0;

    

      TiempoTranscurrido = millis() - (TiempoInicio+ this.Tiempo_Pausa );


      int Segundos = int(TiempoTranscurrido / 1000.0);


      int centiSegundos = int((TiempoTranscurrido % 1000) / 10.0);
      textSize(40);
      fill(0);
      fill(255, 255, 255);
      String TiempoParaMostrar = nf(Segundos, 2) + ":" + nf(centiSegundos, 2);
      text(TiempoParaMostrar, 10, 35);


      fill(255, 255, 255);
      this.coin.display();
      image(CountAguas, 1200-112, 15);/*47*/
      text(nf(this.coin.coinsRecaudadas, 2), 1200-112+50, 45);
      
      text("Pulsa P para pausar",width/3, 580);

      //// Se aumentan las vidas
      if(confirmar_vida==true){
        vidas=vidas+1;
        confirmar_vida=false;
      }
      if(vidas>3){
        vidas=3;
      }
      corazon.resize(50, 40);
      image(corazon, (width/2)-30, 10);
      textSize(40);
      fill(0);
      fill(255,255, 255);
      text(vidas, (width/2)+10, 42);

      PFont mono;
      mono = createFont("PoetsenOne-Regular.ttf", 38);
      textFont(mono);



      /*if (this.coin.coinsRecaudadas%5 == 0 && this.coin.coinsRecaudadas!=0 ){
       this.vidas = this.vidas +1 ;
       
       }*/
       
       if(Segundos==100){
        textSize(32);
        fill(255, 0, 0);
        text("¡GANASTE! :)", width/2 - 150, height/2);
        text("Para reiniciar oprime R", width/2 - 150, suelo-30);
        text("Para terminar oprime K", width/2 - 150, suelo);
        Escena1=false;
        Recovery = true;
       }
    }else{
      
     this.Tiempo_Pausa = millis() - Tiempo_Pausa_Inicio;
     println(this.Tiempo_Pausa);
    
    }
      
  }


  void setPersonaje(ArrayList<PImage> Personajes_Elegidos) {
    this.coin =new Coin();
    this.CountAguas = loadImage("CountCoins.png");
    for (int k = 0; k< Personajes_Elegidos.size(); k++ )

      Jugadores.add(new Jugador(Personajes_Elegidos.get(k), k)   );
  }

  // Setter para la variable "escenario"
  void setEscenario(PImage escenario) {
    this.Escenario = escenario;
    Escenario.resize(width, 450);
    text(vidas, 1160, 42);
    piso = loadImage("data/Suelo.png"); // Piso
    piso.resize(1200, 400); // Piso
    TiempoInicio = millis();
    corazon=loadImage("corazon.png");
  }







  void keyPressed() {

    for (int j =0; j < Jugadores.size(); j++) {//Preguntar por cada Jugador

      Jugadores.get(j).keyPressed();
    }

    if (keyCode=='p' | keyCode=='P') {
      text("Pausado",width/2-60, 300);
      
       if(pausa == false ){
           Tiempo_Pausa_Inicio=millis ();
       }
    
      this.pausa=! pausa;
      

    }
  }

  void keyReleased() {
    for (int j =0; j < Jugadores.size(); j++) {//Preguntar por cada Jugador

      Jugadores.get(j).keyReleased();
    }
  }
}

















class Obstaculos {




  ArrayList<Obstaculo> obstaculos = new ArrayList<Obstaculo>();

  float TasaNuevosObstaculos = 140;

  int TiempoInicio = millis();
  int TiempoTranscurrido;

Obstaculos(){
    ArrayList<Obstaculo> obstaculos = new ArrayList<Obstaculo>();

this.TasaNuevosObstaculos = 150;
}


  void draw() {

    for (int i = obstaculos.size() - 1; i >= 0; i--) {
      this.obstaculos.get(i).display();
      this.obstaculos.get(i).update();
      if (this.obstaculos.get(i).x < -40 ) { // Eliminar el obstaculo si sale de la pantalla
        this.obstaculos.remove(i);
      }
    }
    
      TiempoTranscurrido = millis() - TiempoInicio;
      int Segundos = int(TiempoTranscurrido / 1000.0);

    if (frameCount % TasaNuevosObstaculos == 0 ) {


      this.TasaNuevosObstaculos = this.TasaNuevosObstaculos;

print( TasaNuevosObstaculos);

      if ( int(random(2))  == 0 ) {

        Gato gatico = new Gato(1200, suelo,  5+(int(floor(Segundos/15))));
        this.obstaculos.add(gatico);
      } else {
        Iguana iguana = new Iguana(1200+400-400, suelo-511, 5+(int(floor(Segundos/15))));
        this.obstaculos.add(iguana);
      }
    }
  }

  boolean  Chocaron(float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersoanje, boolean boleaColision) {

    for (int i = obstaculos.size() - 1; i >= 0; i--) {

      if (this.obstaculos.get(i).golpeaJugador( xPersonaje, anchoPersonaje, yPersonaje, altoPersoanje, boleaColision)) {
        // Si el perosonaje  choca detener el juego
        return true;
      }
    }
    return false ;
  }
}


























class Iguana implements Obstaculo {
  float x, y; // Posición del gato
  float speed; // Velocidad de movimiento del gato
  boolean golpeaJugador= false;
  PImage ImgIguanaArbol;


  PImage popo;
  float xpopo, ypopo; // Posición del gato
  boolean moverPopo =false;
  float speedPopoX = random(-5, 10);
  float speedPopoY = random(1, 10);
  int AnchoPopo = 30, AltoPopo=22;


  // Constructor de la clase Iguana
  Iguana(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;

    ImgIguanaArbol = loadImage("ObsIguana.png");
    ImgIguanaArbol.resize(400, 511);


    popo = loadImage("popo.png");
    popo.resize(int(AnchoPopo), AltoPopo);
  }

  // Método para actualizar la posición del gato
  void update() {
    x -= speed; // Mover el gato hacia la izquierda

    if (x <= (width/2)+10 &&  x >= (width/2)-10 ) {
      moverPopo = true;
    }
  }


  void display() {

    image(ImgIguanaArbol, x, y);

    if (moverPopo == false) {
      image(popo, x+180, y+150);
      xpopo = x+180;
      ypopo = y+150;
    } else {


      if (ypopo < 480 ) {

        xpopo -= speedPopoX;
        ypopo += speedPopoY;

        image(popo, xpopo, ypopo);
      }
    }
  }

  // Método para verificar si el gato golpea al personaje

  boolean golpeaJugador (float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersonaje, boolean boleaColision) {

    if (boleaColision==false) {
      return (xPersonaje + anchoPersonaje - 20 >=   this.xpopo && xPersonaje+20 < this.xpopo + AnchoPopo    &&  (this.ypopo < yPersonaje+altoPersonaje && this.ypopo+AltoPopo > yPersonaje)  )   ;
    } else {
      return false;
    }
  }
}







class Gato implements Obstaculo {
  float x, y; // Posición del gato
  float speed; // Velocidad de movimiento del gato
  boolean golpeaJugador= false;
  PImage ImgGato ;

  int anchoGato = 72;
  int altoGato = 62;


  // Constructor de la clase gato
  Gato(float AnchoVentana, float AltoVentana, float speed) {
    this.x = AnchoVentana - anchoGato  ;
    this.y = AltoVentana - altoGato;
    this.speed = speed;



    ImgGato = loadImage("Gato.png");
    ImgGato.resize(anchoGato, altoGato);
  }

  // Método para actualizar la posición del gato
  void update() {
    x -= speed; // Mover el gato hacia la izquierda
  }

  // Método para dibujar el gato en la pantalla
  void display() {

    image(ImgGato, x, y);
  }

  // Método para verificar si el gato golpea al personaje
  boolean golpeaJugador (float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersonaje, boolean boleaColision) {
    // Verificar si las coordenadas del obstaculo se superponen con las del personaje
    if (boleaColision==false) {
      if (xPersonaje + anchoPersonaje  -30 >=   this.x && xPersonaje+20 <= this.x + anchoGato    &&   yPersonaje + altoPersonaje > this.y) {
   
      delay(100);
      
      }
      return (xPersonaje + anchoPersonaje  -10 >=   this.x && xPersonaje+10 <= this.x + anchoGato    &&   yPersonaje + altoPersonaje > this.y)   ;
    } else {
      return false;
    }
  }
}




interface Obstaculo {
  void display();
  void update();
  boolean golpeaJugador(float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersoanje, boolean boleaColision );

  float x = 0;
  float y = 0;
}


class Jugador {

  int control;

  PImage Imagen;
  int Width_Personaje_Principal = 50;
  int Height_Personaje_Principal = 200;
  int grav=10;
  //para el sistema de movimiento
  boolean jumping1 = false;
  boolean rightKeyPressed1 = false;
  boolean leftKeyPressed1 = false;
  boolean jumping2 = false;
  boolean rightKeyPressed2 = false;
  boolean leftKeyPressed2 = false;

  //Posicion del Personaje
  float xpos = (width/2)/2 - (Width_Personaje_Principal/2);
  float ypos= suelo-Height_Personaje_Principal;



  Jugador(PImage Imagen, int controles) {
    
    this.xpos = (width/2)/2 - (Width_Personaje_Principal/2)+40*controles;

    this.Imagen  = Imagen;
    this.Imagen.resize(this.Width_Personaje_Principal, this.Height_Personaje_Principal);
    this.control= controles;
  }
  //desde acá empieza
  void movimiento1() {
    // Movimiento horizontal
    if (rightKeyPressed1==true) {
      this.xpos = this.xpos+ speed;
    } else if (leftKeyPressed1) {
      this.xpos = this.xpos-speed;
    }

    // Aplicar gravedad
    if (this.ypos < suelo-Height_Personaje_Principal) {
      this.ypos =this.ypos+15;
    } else {
      this.ypos = suelo-Height_Personaje_Principal; // Asegurar que el personaje no atraviese el suelo
      jumping1 = false; // Detener el salto cuando toca el suelo
    }
  }
  void movimiento2() {
    // Movimiento horizontal
    if (rightKeyPressed2==true) {
      this.xpos = this.xpos+ speed;
    } else if (leftKeyPressed2) {
      this.xpos = this.xpos-speed;
    }

    // Aplicar gravedad
    if (this.ypos < suelo-Height_Personaje_Principal) {
      this.ypos =this.ypos+ 15;
    } else {
      this.ypos = suelo-Height_Personaje_Principal; // Asegurar que el personaje no atraviese el suelo
      jumping2 = false; // Detener el salto cuando toca el suelo
    }
  }
  //acá termina la tortura
  void draw() {


    image(this.Imagen, this.xpos, this.ypos );
    if (this.control == 0) {
      movimiento1();
    } else {
      movimiento2();
    }
  }

  void keyPressed() {


    if (this.control == 0) {

      if (keyCode == 'd' || keyCode=='D') {
        this.rightKeyPressed1 = true;
      } else if (keyCode == 'a' || keyCode=='A') {
        this.leftKeyPressed1 = true;
      } else if (keyCode == 'w' || keyCode=='W' && !jumping1) {
        this.jumping1 = true;
        this.ypos -= 500; // Salto
      }
    } else {
      if (keyCode == RIGHT) {
        this.rightKeyPressed2 = true;
      } else if (keyCode == LEFT) {
        this.leftKeyPressed2 = true;
      } else if (keyCode == UP && !jumping2) {
        this.jumping2 = true;
        this.ypos -= 500; // Salto
      }
    }


    this.xpos = constrain(this.xpos, 0, width - this.Width_Personaje_Principal);
    this.ypos = constrain(this.ypos, 0, suelo - this.Height_Personaje_Principal);
  }
  void keyReleased() {
    if (this.control == 0) {

      if (keyCode == 'd' || keyCode=='D') {
        this.rightKeyPressed1 = false;
      } else if (keyCode == 'A' || keyCode=='a') {
        this.leftKeyPressed1 = false;
      }
    } else {
      if (keyCode == RIGHT) {
        this.rightKeyPressed2 = false;
      } else if (keyCode == LEFT) {
        this.leftKeyPressed2 = false;
      }
    }

    this.xpos = constrain(this.xpos, 0, width - this.Width_Personaje_Principal);
    this.ypos = constrain(this.ypos, 0, suelo - this.Height_Personaje_Principal);
  }
}




class Coin {
  float x, y; // Posición del coin
  boolean TomaAgua= false;
  PImage ImgAgua;

  int anchoCoin = 26;
  int altoCoin= 47;
  int coinsRecaudadas = 0;




  // Constructor de la clase Coin
  Coin() {
    /* this.x = AnchoVentana - anchoGato  ;
     this.y = AltoVentana - altoGato;*/
    this.ImgAgua=  loadImage("coin.png");

    this.ImgAgua.resize(anchoCoin, altoCoin);

    this.x=random(0, 1200-anchoCoin-75);
    this.y=480-47;
  }




  // Método para dibujar el agua en la pantalla
  void display() {
    image(ImgAgua, x, 480-altoCoin);
  }

  // Método para verificar si el gato golpea al personaje
  void TomoAgua (float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersonaje) {


    if (xPersonaje + anchoPersonaje - 10 >=   this.x & xPersonaje+10 <= this.x + anchoCoin & yPersonaje + altoPersonaje >= this.y) {

      this.x=int(random(0, 1200-anchoCoin-30));
      this.coinsRecaudadas = this.coinsRecaudadas + 1;
      CoinRec=true;
      CoinPlaying=false;
      CoinRecogida();
      if (coinsRecaudadas%10==0){
        confirmar_vida=true;
      }
    }
  }
}
