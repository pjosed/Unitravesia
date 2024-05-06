void Elegir_Escenario () { /////////////////////////////////////////// SELECCION DEL ESCENARIO
  escenario[0]= loadImage("Escenario.jpg");
  escenario[0].resize(width, height);
  background(escenario[0]);
  escenario[1]= loadImage("bibliotecacc.png"); // Biblioteca
  escenario[1].resize(width/5, 100);
  biblio=loadImage("bibliotecaEsc.png");
  image(biblio, 100, height/6,350,200);
  escenario[2]= loadImage("casaestudiocc.png"); // Casa estudio
  escenario[2].resize(width/5, 100);
  casa=loadImage("casaestudioEsc.png");
  image(casa, 450, 300,350,200);
  //image(escenario[2], 475, 300);//aquí van cambios
  escenario[3]= loadImage("bloquejcc.png"); // Bloque J
  escenario[3].resize(width/5, 100);
  bloque=loadImage("bloquejEsc.png");
  image(bloque, 800, 100,350,200);
  esc[0]="Elige donde quieres jugar!!";
  textSize(20);
  fill(0);
  text(esc[0], 500, 20);
  atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
}
