void Elegir_Escenario () { /////////////////////////////////////////// SELECCION DEL ESCENARIO
  escenario[0]= loadImage("Escenario.jpg");
  escenario[0].resize(width, height);
  background(escenario[0]);
  escenario[1]= loadImage("bibliotecacc.png"); // Biblioteca
  escenario[1].resize(width/5, 100);
  image(escenario[1], 100, height/6);
  escenario[2]= loadImage("casaestudiocc.png"); // Casa estudio
  escenario[2].resize(width/5, 100);
  image(escenario[2], 475, 300);
  escenario[3]= loadImage("bloquejcc.png"); // Bloque J
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
