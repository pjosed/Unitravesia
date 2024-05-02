



Obstaculos obstaculosEscena = new Obstaculos();




class Escena_Juego { ////////////////////////////////////////////////////////////// Escena del videojuego
    PImage Personaje;
    PImage Escenario;

    int Width_Personaje_Principal = 50;
    int Height_Personaje_Principal = 200;
    float suelo = 450; // Posición del suelo
    float xpos = (width/2) - (Width_Personaje_Principal/2);
    float ypos= suelo-Height_Personaje_Principal;
    
    
    

    
    int startTime;
    int elapsedTime;
    
    float VelocidadY = 0; // Velocidad inicial del personaje en el eje y
  

    // Setter para la variable "personaje"
    void setPersonaje(ArrayList<PImage> Personajes_Elegidos) {
        this.Personaje = Personajes_Elegidos.get(0);
        this.Personaje.resize(this.Width_Personaje_Principal,this.Height_Personaje_Principal);
    }

    // Setter para la variable "escenario"
    void setEscenario(PImage escenario) {
        this.Escenario = escenario;
        Escenario.resize(width, 450);
          piso = loadImage("data/Suelo.png"); // Piso
          piso.resize(1200, 400); // Piso
        
          startTime = millis();
          


    }





void draw (){
       
background(255); 

     image(Escenario, 0, 0 ); //Escenario
     image(piso, 0, suelo); // Piso
  
obstaculosEscena.draw(xpos,Width_Personaje_Principal,ypos,Height_Personaje_Principal);

  image(Personaje,xpos,  ypos );  //Personaje
  
  
  ypos +=  VelocidadY;
  VelocidadY += 7; // Gravedad
  
 
  if (ypos > suelo - 200) {
    ypos = suelo - 200;
    VelocidadY = 0;
  }
  
  
  
  
  /////// hasta aqui escenario y persona
  
    

  

 
 

  elapsedTime = millis() - startTime;
  
   
  int seconds = int(elapsedTime / 1000.0);
  
  

  
  int centiseconds = int((elapsedTime % 1000) / 10.0);
  textSize(40);
  fill(0);
  
  String timeString = nf(seconds, 2) + ":" + nf(centiseconds, 2);
  text(timeString, 10,35);
  
  

  
}


void keyPressed() {
  
    if (keyCode == 'A' || keyCode == 'a') {
      izquierda = true;
      xpos = xpos - 60;
      //Añadir que el personaje corra hacia la izquierda añadiendo el gif o imagen
    } else if (keyCode == 'D' || keyCode == 'd') {
      derecha = true;
      xpos = xpos + 60;
      //Añadir que el personaje corra hacia la derecha añadiendo el gif o imagen
    } 
    
    if (( key == 'W' || key =='w') && ypos == suelo - 200) {
      VelocidadY = -60; // Impulso inicial hacia arriba para el salto
  }
  
  
    xpos = constrain(xpos, 0, width - Width_Personaje_Principal);
    ypos = constrain(ypos, 0, suelo - Height_Personaje_Principal);
    
    }

}

















class Obstaculos {
  
  
  
  
  ArrayList<Obstaculo> obstaculos = new ArrayList<Obstaculo>();
  
  float rateNewObs = 120;
  
   

  
  
  void draw(float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersoanje){
    
    for (int i = obstaculos.size() - 1; i >= 0; i--) {
     
      
     this.obstaculos.get(i).display();
     this.obstaculos.get(i).update();
     
     
    if (this.obstaculos.get(i).x < -16 /*  cambiar el 16 por el ancho del gato  */ ) { // Eliminar el obstaculo si sale de la pantalla 
      this.obstaculos.remove(i);
    }
    
    
    
     if (this.obstaculos.get(i).golpeaJugador( xPersonaje,  anchoPersonaje, yPersonaje,  altoPersoanje)) {
      // Si el perosonaje  choca con un , detener el juego
      textSize(32);
      fill(255, 0, 0);
      text("¡Juego terminado!", width/2 - 150, height/2);
      noLoop();
    }
      
    }

   if (frameCount % rateNewObs == 0 ) {
     
     
    this.rateNewObs = this.rateNewObs-1 ; 
    
    
    if ( int(random(2))  == 0 ){
      
    Gato gatico = new Gato(1200,450,10);
    this.obstaculos.add(gatico);
      
    }else{
    Iguana iguana = new Iguana(1200+400-400,450-511,10);
    this.obstaculos.add(iguana); 
    }
    
    
    
  }
    
  }
  
  }

 
























class Iguana implements Obstaculo  {
  float x, y; // Posición del gato 
  float speed; // Velocidad de movimiento del gato
  boolean golpeaJugador= false; 
  PImage ImgIguanaArbol;
  
  
  PImage popo;
  float xpopo, ypopo; // Posición del gato 
  boolean moverPopo =false;
  float speedPopoX = random(-5,10);
  float speedPopoY = random(1,10);
  int AnchoPopo = 30 , AltoPopo=22;


  // Constructor de la clase gato
  Iguana(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    
    ImgIguanaArbol = loadImage("ObsIguana.png");
    ImgIguanaArbol.resize(400,511); 
    
    
    popo = loadImage("popo.png");
    popo.resize(int(AnchoPopo),AltoPopo); 
    
  }

  // Método para actualizar la posición del gato
  void update() {
    x -= speed; // Mover el gato hacia la izquierda
    
    if (x <= (width/2)+10 &&  x >= (width/2)-10 ){
    moverPopo = true;
    }
    
    
    
   
  }


  void display() {
  
image(ImgIguanaArbol,x,  y); 

if (moverPopo == false){
  image(popo,x+180 , y+150); 
  xpopo = x+180;
  ypopo = y+150;

  
}else{
  
  
  if(ypopo < 450 ){
    
   xpopo -= speedPopoX;
   ypopo += speedPopoY;
   
  image(popo,xpopo , ypopo);

  }

  
  
  
  
}


    
       
    
  }

  // Método para verificar si el gato golpea al personaje
  
    boolean golpeaJugador (float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersonaje) {
    // Verificar si las coordenadas del cactus se superponen con las del dinosaurio
    
         return (xPersonaje + anchoPersonaje - 20 >=   this.xpopo && xPersonaje < this.xpopo + AnchoPopo    &&  (this.ypopo < yPersonaje+altoPersonaje && this.ypopo+AltoPopo > yPersonaje)  )   ;
    
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
    ImgGato.resize(anchoGato,altoGato); 
    
   
  }

  // Método para actualizar la posición del gato
  void update() {
    x -= speed; // Mover el gato hacia la izquierda
  }

  // Método para dibujar el gato en la pantalla
  void display() {
    
      image(ImgGato,x,  y); 
      
      
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




  
  
