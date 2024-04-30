

Obstaculos obstaculosEscena = new Obstaculos();




class Escena_Juego { ////////////////////////////////////////////////////////////// Escena del videojuego
    PImage Personaje;
    PImage Escenario;

    int Width_Personaje_Principal = 50;
    int Height_Personaje_Principal = 200;
    float suelo = 450; // Posición del suelo
    float xpos = (width/2) - (Width_Personaje_Principal/2);
    float ypos= suelo-Height_Personaje_Principal;
    
    
     float ObastaculoNewRate = 60 ;
    

    
    float VelocidadY = 0; // Velocidad inicial del personaje en el eje y
  

    // Setter para la variable "personaje"
    void setPersonaje(PImage personaje) {
        this.Personaje = personaje;
        this.Personaje.resize(this.Width_Personaje_Principal,this.Height_Personaje_Principal); 

        
    }

    // Setter para la variable "escenario"
    void setEscenario(PImage escenario) {
        this.Escenario = escenario;
        Escenario.resize(width, 450);
          piso = loadImage("data/Suelo.png"); // Piso
          piso.resize(1200, 400); // Piso
          image(piso, 0, suelo); // Piso
        

    }





void draw (){


  
  image(Escenario, 0, 0 ); //Escenario

  image(Personaje,xpos,  ypos );  //Personaje
  
  
  ypos +=  VelocidadY;
  VelocidadY += 10; // Gravedad
  
 
  if (ypos > suelo - 200) {
    ypos = suelo - 200;
    VelocidadY = 0;
  }
  
  
  
  
  /////// hasta aqui escenario y persona

  
 obstaculosEscena.draw(xpos,Width_Personaje_Principal,ypos,Height_Personaje_Principal);
 
 

  
  
   
  
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
  
  float rateNewObs = 80;
  
   

  
  
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

  // for (int i = obstaculos.size() - 1; i >= 0; i--) {
     
     
    //obstaculos.get(i); Obtener un obstaculo de la lista
    
    
    //obstaculos.get(i).update(); // Actualizar la posición del obstaculo
    
    
   // this.obstaculos.get(i).display(); // Dibujar el obstaculo en la pantalla
    

    
    

    
    
    
   if (frameCount % rateNewObs == 0 ) {
     
     
    this.rateNewObs = this.rateNewObs-1 ; 
    
    
    if ( int(random(2))  == 0 ){
      
    Gato gatico = new Gato(1200-30,450-30,10);
    this.obstaculos.add(gatico);
      
    }else{
      
    Iguana iguana = new Iguana(1200-50,450-200,10);
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


  // Constructor de la clase gato
  Iguana(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    
    ImgIguanaArbol = loadImage("ObsIguana.png");
    ImgIguanaArbol.resize(150,100); 
    
  }

  // Método para actualizar la posición del gato
  void update() {
    x -= speed; // Mover el gato hacia la izquierda
  }

  void display() {
  
image(ImgIguanaArbol,x,  y); 
    
       
    
  }

  // Método para verificar si el gato golpea al personaje
  
    boolean golpeaJugador (float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersoanje) {
    // Verificar si las coordenadas del cactus se superponen con las del dinosaurio
    
        //boolean r  = (xPersonaje + anchoPersonaje > this.x && xPersonaje < x + 16 /* cabiar por el anho de la imagen del gato */ && yPersonaje + altoPersoanje > this.y);
    
    return false;
    

    
  }
 
}







class Gato implements Obstaculo {
  float x, y; // Posición del gato 
  float speed; // Velocidad de movimiento del gato
  boolean golpeaJugador= false; 

  // Constructor de la clase gato
  Gato(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
  }

  // Método para actualizar la posición del gato
  void update() {
    x -= speed; // Mover el gato hacia la izquierda
  }

  // Método para dibujar el gato en la pantalla
  void display() {
    fill(0, 150, 0); 
    rect(x, y, 20, 30);
  }

  // Método para verificar si el gato golpea al personaje
  
    boolean golpeaJugador (float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersoanje) {
    // Verificar si las coordenadas del cactus se superponen con las del dinosaurio
    return (xPersonaje + anchoPersonaje > this.x && xPersonaje < x + 16 /* cabiar por el anho de la imagen del gato */ && yPersonaje + altoPersoanje > this.y);
  }

}




interface Obstaculo {
    void display();
    void update();
    boolean golpeaJugador(float xPersonaje, int anchoPersonaje, float yPersonaje, int altoPersoanje );
    
    float x = 0;
    float y = 0;
    
}




  
  
