void escena1() { ////////////////////////////////////////////////////////////// Escena del videojuego
  personaje[0].resize(200, 100);  
  personaje[1].resize(200, 100);  
  personaje[2].resize(200, 100);  
  escprincipal.resize(width, 400);
  background(#FFFFFF);   
  image(escprincipal, 0, 0 ); //Escenario
  piso = loadImage("data/Suelo.png"); // Piso
  piso.resize(1200, 400); // Piso
  image(piso, 0, suelo+50); // Piso
  
  image(pprincipal,xpos,ypos);  //Personaje
 
  
  fill(0);
  ellipse(gatoposx, gatoposy, 40, 40);
  fill(#27D631);


  if (gatoposx < 0) {
    gatoposx = width;
  }
  gatoposx -= 5;

  // Movimiento horizontal
  if (izquierda) {
    xpos -= speed;
  }
  if (derecha) {
    xpos += speed;
  }

  // Limitar laterales
  xpos = constrain(xpos, 0, width - 20);

  // Aplicar gravedad si no está en el suelo
  if (ypos < suelo) {
    ypos += gravedad;
  }

  // Evitar que se pase del suelo
  if (ypos > suelo) {
    ypos = suelo;
  }
}
