void escenario () { /////////////////////////////////////////////////7// SELECCION DEL ESCENARIO 1 JUGADOR
  escenario[0]= loadImage("Escenario.jpg");
  escenario[0].resize(width, height);
  background(escenario[0]);
  escenario[1]= loadImage("e11.png"); // Biblioteca
  escenario[1].resize(width/5, 100);
  image(escenario[1], 100, height/6);
  escenario[2]= loadImage("e22.png"); // Casa estudio
  escenario[2].resize(width/5, 100);
  image(escenario[2], 475, 300);
  escenario[3]= loadImage("e33.png"); // Bloque J
  escenario[3].resize(width/5, 100);
  image(escenario[3], 800, 100);
  esc[0]="Elige donde quieres jugar!!";
  esc[1]="Biblioteca";
  esc[2]="Casa estudio";
  esc[3]="Bloque J";
  textSize(20);
  fill(0);
  text(esc[0], 500, 20);
  fill(0);
  text(esc[1], 150, 250);
  fill(0);
  text(esc[2], 550, 450);
  fill(0);
  text(esc[3], 900, 250);
  atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
}

void personajes() { //////////////////////////////////////////////////// SELECCIONAR PERSONAJES 1 JUGADOR
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

  background(#FFFFFF);
  a= "Escoje con quien deseas jugar! :)";

  personaje[0]= loadImage("jose.png");
  personaje[1]= loadImage("alexander.png");
  personaje[2]= loadImage("sergio.png");
 
  image(personaje[0], 0, 0);
  image(personaje[1], width/3, 0);
  image(personaje[2], width-width/3, 15);
  piso = loadImage("Suelo.png");
  piso.resize(1200, 300);
  image(piso, 0, suelo);
  text(a, 400, 440);
  textSize(34);
  fill(cl1, cl2, cl3);
  atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
}
