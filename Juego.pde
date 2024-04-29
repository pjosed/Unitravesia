

class Escena_Juego { ////////////////////////////////////////////////////////////// Escena del videojuego



    PImage Personaje;
    PImage Escenario;

    int Width_Personaje_Principal = 50;
    int Height_Personaje_Principal = 200;
    float suelo = 450; // Posición del suelo
    float xpos = (width/2) - (Width_Personaje_Principal/2);
    float ypos= suelo-Height_Personaje_Principal;
  

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
  
}


void keyPressed() {
  
    if (keyCode == 'A' || keyCode == 'a') {
      izquierda = true;
      xpos = xpos - 25;
      //Añadir que el personaje corra hacia la izquierda añadiendo el gif o imagen
    } else if (keyCode == 'D' || keyCode == 'd') {
      derecha = true;
      xpos = xpos + 25;
      //Añadir que el personaje corra hacia la derecha añadiendo el gif o imagen
    } 
    
    }

}
  
  
