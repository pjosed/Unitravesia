void Escena_Personajes(int NumPer) {
  
  float suelo  = 300; // Posición del suelo 
  
  cl1=cl1+10;
  cl2=cl2+10;
  cl3=cl3+10;
  if (cl1>256) {
    cl1=0;
  }
  if (cl2>256) {
    cl2=0;
  }
  if (cl3>256) {
    cl3=0;
  }

  fondo_menu=loadImage("azuldegradado.jpg");
  image(fondo_menu, 0, 0, width, height);
  
  a= "Escoje el jugador " + (NumPer+1) + "! :)";

  personaje[0]= loadImage("jose.png");
  personaje[1]= loadImage("alexander.png");
  personaje[2]= loadImage("sergio.png");
  
  piso = loadImage("suelo11.png");
  piso.resize(1200, 300);
  image(piso, 0, suelo);
  text(a, 400, 440);
  textSize(34);
  fill(cl1, cl2, cl3);
  atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
 
  image(personaje[0], 0, 0);
  image(personaje[1], width/3, 0);
  image(personaje[2], width-width/3, 0);

}
