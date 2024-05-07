void Escena_Creditos() { /////////////////////////////////////////////////////////////// CREDITOS
  credits = loadImage("creds.png");
  credits.resize(width, height);
  image(credits, 0, 0);
  atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
  adelante= loadImage("Adl.png");
  adelante.resize(120, 100);
  image(adelante, 5, 5);
}
void Escena_Creditos2() { /////////////////////////////////////////////////////////////// CREDITOS2
  credits2 = loadImage("creditos2.jpg");
  credits2.resize(width, height);
  image(credits2, 0, 0);
  atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
}
