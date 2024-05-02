void Escena_Creditos() { /////////////////////////////////////////////////////////////// CREDITOS
  credits = loadImage("creds.png");
  credits.resize(width, height);
  image(credits, 0, 0);
  atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
}
