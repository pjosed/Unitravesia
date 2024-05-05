void pregunta(){ ///////////////////////////////////////////////////////PREGUNTA SI 1 O 2 JUGADORES

  fondo2=loadImage("fondo2.jpg");
  image(fondo2, 0, 0, width, height);
  textSize(40);
  fill(#FFFCFC);
  fill(#FFFCFC);
  text("Multiplayer", width/2.5, height/2);
  text("OnlyPlayer", width/2.5, height/4.5);
   atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
  
  
}
