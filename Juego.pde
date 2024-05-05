float suelo = 450; // Posición del suelo
PImage CantAgua;


Obstaculos obstaculosEscena = new Obstaculos();





class Escena_Juego { ////////////////////////////////////////////////////////////// Escena del videojuego

  ArrayList<Jugador>  Jugadores = new ArrayList<Jugador>();
  Coin coin;

  boolean pausa = false;
  PImage Escenario;
  float suelo = 450; // Posición del suelo

  int TiempoInicio;
  int TiempoTranscurrido;

  // Setter para la variable "personaje"
  void setPersonaje(ArrayList<PImage> Personajes_Elegidos) {
    this.coin =new Coin();
    for (int k = 0; k< Personajes_Elegidos.size(); k++ )

      Jugadores.add(new Jugador(Personajes_Elegidos.get(k), k)   );
  }

  // Setter para la variable "escenario"
  void setEscenario(PImage escenario) {
    this.Escenario = escenario;
    Escenario.resize(width, 450);
    piso = loadImage("data/Suelo.png"); // Piso
    piso.resize(1200, 400); // Piso

    TiempoInicio = millis();
  }





  void draw () {

    if (pausa == false) {

      background(255);

      image(Escenario, 0, 0 ); //Escenario
      image(piso, 0, suelo); // Piso
      CantAgua=loadImage("coin.png");
      image(CantAgua, 1125, 0);
      obstaculosEscena.draw();

      for (int j =0; j < Jugadores.size(); j++) {//Preguntar por cada Jugador

        obstaculosEscena.Chocaron(Jugadores.get(j).xpos, Jugadores.get(j).Width_Personaje_Principal, Jugadores.get(j).ypos, Jugadores.get(j).Height_Personaje_Principal);


        Jugadores.get(j).draw();
      }

      for (int j =0; j < Jugadores.size(); j++) {//Preguntar por cada Jugador si tomo agua
        coin.TomoAgua(Jugadores.get(j).xpos, Jugadores.get(j).Width_Personaje_Principal, Jugadores.get(j).ypos, Jugadores.get(j).Height_Personaje_Principal);
      }



      /////// hasta aqui escenario y persona





      TiempoTranscurrido = millis() - TiempoInicio;


      int Segundos = int(TiempoTranscurrido / 1000.0);




      int centiSegundos = int((TiempoTranscurrido % 1000) / 10.0);
      textSize(40);
      fill(0);

      String TiempoParaMostrar = nf(Segundos, 2) + ":" + nf(centiSegundos, 2);
      text(TiempoParaMostrar, 10, 35);



      this.coin.display();
      text(this.coin.coinsRecaudadas, 1200-30, 35);
    }
  }

  void keyPressed() {

    for (int j =0; j < Jugadores.size(); j++) {//Preguntar por cada Jugador

      Jugadores.get(j).keyPressed();
    }

    if (keyCode=='p' | keyCode=='P') {
      this.pausa=! pausa;
    }
  }
}

















class Obstaculos {




  ArrayList<Obstaculo> obstaculos = new ArrayList<Obstaculo>();

  float TasaNuevosObstaculos = 120;





  void draw() {

    for (int i = obstaculos.size() - 1; i >= 0; i--) {
      this.obstaculos.get(i).display();
      this.obstaculos.get(i).update();
      if (this.obstaculos.get(i).x < -40 ) { // Eliminar el obstaculo si sale de la pantalla
        this.obstaculos.remove(i);
      }
    }

    if (frameCount % TasaNuevosObstaculos == 0 ) {


      this.TasaNuevosObstaculos = this.TasaNuevosObstaculos-1 ;

      if ( int(random(2))  == 0 ) {

        Gato gatico = new Gato(1200, 450, 10);
        this.obstaculos.add(gatico);
      } else {
        Iguana iguana = new Iguana(1200+400-400, 450-511, 10);
        this.obstaculos.add(iguana);
      }
    }
  }

  boolean  Chocaron(float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersoanje) {

    for (int i = obstaculos.size() - 1; i >= 0; i--) {

      if (this.obstaculos.get(i).golpeaJugador( xPersonaje, anchoPersonaje, yPersonaje, altoPersoanje)) {
        // Si el perosonaje  choca con un , detener el juego
        textSize(32);
        fill(255, 0, 0);
        text("¡Juego terminado!", width/2 - 150, height/2);
        noLoop();
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


  // Constructor de la clase gato
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


      if (ypopo < 450 ) {

        xpopo -= speedPopoX;
        ypopo += speedPopoY;

        image(popo, xpopo, ypopo);
      }
    }
  }

  // Método para verificar si el gato golpea al personaje

  boolean golpeaJugador (float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersonaje) {
    // Verificar si las coordenadas del cactus se superponen con las del dinosaurio

    return (xPersonaje + anchoPersonaje - 20 >=   this.xpopo && xPersonaje+10 <= this.xpopo + AnchoPopo    &&  (this.ypopo < yPersonaje+altoPersonaje && this.ypopo+AltoPopo > yPersonaje)  )   ;
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

  boolean golpeaJugador (float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersonaje) {
    // Verificar si las coordenadas del cactus se superponen con las del dinosaurio

    //line(0, this.y, 1200, this.y);
    //line(0,yPersonaje + altoPersonaje-20, 1200, yPersonaje + altoPersonaje-20);


    return (xPersonaje + anchoPersonaje - 20 >=   this.x && xPersonaje < this.x + anchoGato    &&   yPersonaje + altoPersonaje > this.y)   ;
  }
}




interface Obstaculo {
  void display();
  void update();
  boolean golpeaJugador(float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersoanje );

  float x = 0;
  float y = 0;
}


class Jugador {

  int control;

  PImage Imagen;
  int Width_Personaje_Principal = 50;
  int Height_Personaje_Principal = 200;

  //Posicion del Personaje
  float xpos = (width/2) - (Width_Personaje_Principal/2);
  float ypos= suelo-Height_Personaje_Principal;

  float VelocidadY = 0; // Velocidad inicial del personaje en el eje y


  Jugador(PImage Imagen, int controles) {

    this.Imagen  = Imagen;
    this.Imagen.resize(this.Width_Personaje_Principal, this.Height_Personaje_Principal);
    this.control= controles;
  }

  void draw() {
    image(this.Imagen, this.xpos, this.ypos );
    this.ypos +=  this.VelocidadY;
    this.VelocidadY += 7; // Gravedad


    if (this.ypos > suelo - 200) {
      this.ypos = suelo - 200;
      this.VelocidadY = 0;
    }
  }

  void keyPressed() {


    if (this.control == 0) {

      if (keyCode == 'A' || keyCode == 'a') {
        izquierda = true;
        this.xpos = this.xpos - 40;
        //Añadir que el personaje corra hacia la izquierda añadiendo el gif o imagen
      } else if (keyCode == 'D' || keyCode == 'd') {
        derecha = true;
        this.xpos = this.xpos + 40;
        //Añadir que el personaje corra hacia la derecha añadiendo el gif o imagen
      }

      if (( key == 'W' || key =='w') && this.ypos == suelo - 200) {
        this.VelocidadY = -60; // Impulso inicial hacia arriba para el salto
      }
    } else {
      if (keyCode == LEFT) {
        izquierda = true;
        this.xpos = this.xpos - 40;
        //Añadir que el personaje corra hacia la izquierda añadiendo el gif o imagen
      } else if (keyCode == RIGHT ) {
        derecha = true;
        this.xpos = this.xpos + 40;
        //Añadir que el personaje corra hacia la derecha añadiendo el gif o imagen
      }

      if (( keyCode == UP ) && this.ypos == suelo - 200) {
        this.VelocidadY = -60; // Impulso inicial hacia arriba para el salto
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

    this.x=random(0, 1200-anchoCoin);
  }




  // Método para dibujar el agua en la pantalla
  void display() {

    image(ImgAgua, x, 450-altoCoin);
  }

  // Método para verificar si el gato golpea al personaje
  void TomoAgua (float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersonaje) {


    if (xPersonaje + anchoPersonaje - 10 >=   this.x && xPersonaje+10 <= this.x + anchoCoin   &&   yPersonaje + altoPersonaje > this.y) {
      this.x=random(0, 1200-anchoCoin);
      this.coinsRecaudadas = this.coinsRecaudadas + 1;
    }
  }
}
