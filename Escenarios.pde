void Elegir_Escenario () { /////////////////////////////////////////// SELECCION DEL ESCENARIO
  escenario[0]= loadImage("Escenario.jpg");
  escenario[0].resize(width, height);
  background(escenario[0]);
  escenario[1]= loadImage("bbl.jpg"); // Biblioteca
  biblio=loadImage("bibliotecaEsc.png");
  image(biblio, 100, height/6,350,200);
  escenario[2]= loadImage("cse.jpg"); // Casa estudio
  casa=loadImage("casaestudioEsc.png");
  image(casa, 450, 300,350,200);
  //image(escenario[2], 475, 300);//aquí van cambios
  escenario[3]= loadImage("blqj.jpg"); // Bloque J
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
