void escena1() { ////////////////////////////////////////////////////////////// JUGAR DE UN JUGADOR
  personaje[0].resize(200, 100);  
  personaje[1].resize(200, 100);  
  personaje[2].resize(200, 100);  
  escprincipal.resize(width, 400);
  
  background(#FFFFFF);   
  image(escprincipal, 0, 0 ); //Escenario
  piso = loadImage("Suelo.png"); // Piso
  piso.resize(1200, 400); // Piso
  image(piso, 0, suelo+50); // Piso
  
  image(pprincipal,xpos,ypos);  //Personaje
 
  
  fill(0);
  ellipse(gatoposx, gatoposy, 40, 40);
  fill(#27D631);
  monedas();
  


  if (gatoposx < 0) {
    gatoposx = width;
  }
  gatoposx -= 5;

  // Movimiento horizontal
  if (izquierda[0]) {
    xpos -= speed;
  }
  if (derecha[0]) {
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

void monedas(){
  xmoneda = xmoneda-speedmoneda;
  moneda=loadImage("coin.png");
  moneda.resize(200,200);
  image(moneda, xmoneda, ymoneda);
  if(xmoneda<0){
    xmoneda= 1200;
    ymoneda= random(150,300);
  }
  
  
}
