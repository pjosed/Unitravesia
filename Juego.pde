

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
    

    
    float VelocidadY = 0; // Velocidad inicial del dinosaurio en el eje y
  

    // Setter para la variable "personaje"
    void setPersonaje(PImage personaje) {
        this.Personaje = personaje;
        this.Personaje.resize(this.Width_Personaje_Principal,this.Height_Personaje_Principal); 

        
    }

    // Setter para la variable "escenario"
    void setEscenario(PImage escenario) {
        this.Escenario = escenario;
    }





void draw (){

  Escenario.resize(width, 450);
  background(#FFFFFF);   
  image(Escenario, 0, 0 ); //Escenario
  piso = loadImage("data/Suelo.png"); // Piso
  piso.resize(1200, 400); // Piso
  image(piso, 0, suelo); // Piso
  image(Personaje,xpos,  ypos );  //Personaje
  
  
  ypos +=  VelocidadY;
  VelocidadY += 10; // Gravedad
  
 
  if (ypos > suelo - 200) {
    ypos = suelo - 200;
    VelocidadY = 0;
  }
  
  
  
  
  /////// hasta aqui escenario y persona

  
 obstaculosEscena.draw();
  
  
   
  
}


void keyPressed() {
  
    if (keyCode == 'A' || keyCode == 'a') {
      izquierda = true;
      xpos = xpos - 50;
      //Añadir que el personaje corra hacia la izquierda añadiendo el gif o imagen
    } else if (keyCode == 'D' || keyCode == 'd') {
      derecha = true;
      xpos = xpos + 50;
      //Añadir que el personaje corra hacia la derecha añadiendo el gif o imagen
    } 
    
    if (( key == 'W' || key =='w') && ypos == suelo - 200) {
      VelocidadY = -50; // Impulso inicial hacia arriba para el salto
  }
  
  
    xpos = constrain(xpos, 0, width - Width_Personaje_Principal);
    ypos = constrain(ypos, 0, suelo - Height_Personaje_Principal);
    
    }

}

















class Obstaculos {
  
  
  
  
  ArrayList<Obstaculo> obstaculos = new ArrayList<Obstaculo>();
  
  float rateNewObs = 80;
  
   

  
  
  void draw(){
    
    for (int i = obstaculos.size() - 1; i >= 0; i--) {
     
      
     this.obstaculos.get(i).display();
     this.obstaculos.get(i).update();
      
    }

  // for (int i = obstaculos.size() - 1; i >= 0; i--) {
     
     
    //obstaculos.get(i); Obtener un obstaculo de la lista
    
    
    //obstaculos.get(i).update(); // Actualizar la posición del obstaculo
    
    
   // this.obstaculos.get(i).display(); // Dibujar el obstaculo en la pantalla
    
    /*if (obstaculo.golpeaJugador) {
      // Si el dinosaurio choca con un cactus, detener el juego
      textSize(32);
      fill(255, 0, 0);
      text("¡Juego terminado!", width/2 - 150, height/2);
      noLoop();
    }*/
    
    
    /*if (obstaculos.get(i).x < -20) { // Eliminar el obstaculo si sale de la pantalla
      obstaculos.remove(i);
    }*/
    
    
    
   if (frameCount % rateNewObs == 0 ) {
    this.rateNewObs = this.rateNewObs-1 ; 
    Gato gatico = new Gato(1200-30,450-30,10);
    this.obstaculos.add(gatico);
  
  }
    
  }
  
  

  
  
  
  

  
  
  
  
  
  
  
  

  }

 
























class Iguana {
  
  ArrayList<Object> obstaculos = new ArrayList<Object>();
  
  
  
  
 
}







class Gato implements Obstaculo {
  float x, y; // Posición del gato 
  float speed; // Velocidad de movimiento del gato

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

  // Método para verificar si el gato golpea al dinosaurio

}




interface Obstaculo {
    void display();
    void update();
}




  
  
