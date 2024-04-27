void escena1( PImage Personaje, PImage Escenario) { ////////////////////////////////////////////////////////////// Escena del videojuego

  float suelo = 450; // Posición del suelo
  float xpos = 200, ypos=250;

  int Width_Personaje_Principal = 50;
  int Height_Personaje_Principal = 200;
  Personaje.resize(Width_Personaje_Principal,Height_Personaje_Principal); 
  
  

  Escenario.resize(width, 450);
  background(#FFFFFF);   
  image(Escenario, 0, 0 ); //Escenario
  piso = loadImage("data/Suelo.png"); // Piso
  piso.resize(1200, 400); // Piso
  image(piso, 0, suelo); // Piso
  
  
  image(Personaje,xpos,suelo-Height_Personaje_Principal);  //Personaje
  
  
  
  
  
  /*
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
  
  
  */

 



 
 
 
 
}
  
  
