void escena0() { ////////////////////////////////////////////////////MENU PRINCIPAL
  sz2=sz2+15;
  cl1=cl1+10;
  cl2=cl2+10;
  cl3=cl3+10;

  if (sz2>width) {
    sz2=0;
  }
  if (cl1>256) {
    cl1=0;
  }
  if (cl2>256) {
    cl2=0;
  }
  if (cl3>256) {
    cl3=0;
  }

  menu[0] = loadImage("Escenario.jpg");
  menu[0].resize(1200, 600);
  image(menu[0], xmenu, ymenu);

  botones[0]=loadImage("Boton_comenzar.png");
  botones[0].resize(width/3, 100);
  image(botones[0], xmenu, ymenu);

  botones[1]=loadImage("Boton_manual.png");
  botones[1].resize(width/3, 100);
  image(botones[1], width/3, ymenu);

  botones[2]=loadImage("Boton_creditos.png");
  botones[2].resize(width/3, 100);
  image(botones[2], width-width/3, ymenu);

  b= "UNITRAVESÍA";
  fill(cl1, cl2, cl3);
  textSize(100);
  text(b, sz2, height/2);
}

void pregunta(){ ///////////////////////////////////////////////////////PREGUNTA SI 1 O 2 JUGADORES

  background(#9D8888);
  textSize(40);
  fill(#FFFCFC);
  fill(#FFFCFC);
  text(player2, width/2.5, height/2);
  text(player1, width/2.5, height/4.5);
   atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
  
  
}

void creditos() { /////////////////////////////////////////////////////////////// CREDITOS
  credits = loadImage("creds.png");
  credits.resize(width, height);
  image(credits, 0, 0);
  atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
}

void manual() { ////////////////////////////////////////////////////////////////// MANUAL
}
