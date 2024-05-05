void pregunta(){ ///////////////////////////////////////////////////////PREGUNTA SI 1 O 2 JUGADORES

  fondo2=loadImage("fondo2.jpg");
  image(fondo2, 0, 0, width, height);
  textSize(40);
  jugador1=loadImage("OnlyPlayer.png");
  jugador2=loadImage("MultiPlayer.png");
  image(jugador2, width/3, height/2,400,100);
  image(jugador1, width/3, height/4.5,400,100);
   atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
  
}
