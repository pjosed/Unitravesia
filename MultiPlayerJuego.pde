void escena2(){ ///////////////////////////////////////////// ESCENA MULTIPLAYER

   personaje[0].resize(200, 100);  
  personaje[1].resize(200, 100);  
  personaje[2].resize(200, 100);  
  escprincipal.resize(width, 400);
  background(#FFFFFF);   
  
  image(escprincipal, 0, 0 ); //Escenario
  piso = loadImage("Suelo.png"); // Piso
  piso.resize(1200, 400); // Piso
  image(piso, 0, suelo+50); // Piso
  pprincipal.resize(200, 100);
  psecundario.resize(200, 100);
  
  image(pprincipal,xpos,ypos);  //Personaje1
  image(psecundario,xpos2,ypos2);  //Personaje2
  
 
  
  fill(0);
  ellipse(gatoposx, gatoposy, 40, 40);
  fill(#27D631);
  monedas();
  


  if (gatoposx < 0) {
    gatoposx = width;
  }
  gatoposx -= 5;

  // Movimiento horizontal JUGADOR 1
  if (izquierda[0]) {
    xpos -= speed;
  }
  if (derecha[0]) {
    xpos += speed;
  }
  // Movimiento horizontal JUGADOR 2
  if (izquierda[1]) {
    xpos2 -= speed;
  }
  if (derecha[1]) {
    xpos2 += speed;
  }

  // Limitar laterales
  xpos = constrain(xpos, 0, width - 20);
  xpos2 = constrain(xpos2, 0, width - 20);

  // Aplicar gravedad si no está en el suelo
  if (ypos < suelo) {
    ypos += gravedad;
  }
  if (ypos2 < suelo) {
    ypos2 += gravedad;
  }

  // Evitar que se pase del suelo
  if (ypos > suelo) {
    ypos = suelo;
  }
  if (ypos2 > suelo) {
    ypos2 = suelo;
  }
  
  
}
