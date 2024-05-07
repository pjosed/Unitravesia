void Escena_Menu() { ///////////////////////////////7 ESCENA DEL MENU
  sz2 = sz2 + 15;
  cl1 = cl1 + 10;
  cl2 = cl2 + 10;
  cl3 = cl3 + 10;

  if (sz2 > width) {
    sz2 = 0;
  }
  if (cl1 > 256) {
    cl1 = 0;
  }
  if (cl2 > 256) {
    cl2 = 0;
  }
  if (cl3 > 256) {
    cl3 = 0;
  }

  menu[0] = loadImage("EscPrinc.jpg");
  image(menu[0], xmenu, ymenu);

  menu[1]= loadImage("cse.jpg");

  if (mouseX >= sz2 && mouseX <= sz2 + textWidth(b) && mouseY >= height/2 - 50 && mouseY <= height/2 + 50) {
    image(menu[1], xmenu, ymenu); ///// SI ESTA SOBRE UNITRAVESIA CAMBIAR FONDO
  } else {
    image(menu[0], xmenu, ymenu); // Sino usamos la imagen de fondo original
  }

  botones[0] = loadImage("Boton_comenzar.png");
  botones[0].resize(width/3, 100);
  if (mouseX >= xmenu && mouseX <= xmenu + width/3 && mouseY >= ymenu && mouseY <= ymenu + 100) {
    tint(255, 150);
  } else {
    noTint();
  }
  image(botones[0], xmenu, ymenu);

  botones[1] = loadImage("Boton_manual.png");
  botones[1].resize(width/3, 100);
  if (mouseX >= width/3 && mouseX <= width/3 + width/3 && mouseY >= ymenu && mouseY <= ymenu + 100) {
    tint(255, 150);
  } else {
    noTint();
  }
  image(botones[1], width/3, ymenu);

  botones[2] = loadImage("Boton_creditos.png");
  botones[2].resize(width/3, 100);
  if (mouseX >= width-width/3 && mouseX <= width && mouseY >= ymenu && mouseY <= ymenu + 100) {
    tint(255, 150);
  } else {
    noTint();
  }
  image(botones[2], width-width/3, ymenu);

  b = "UNITRAVESÍA";
  fill(cl1, cl2, cl3);
  if (mouseX >= sz2 && mouseX <= sz2 + textWidth(b) && mouseY >= height/2 - 50 && mouseY <= height/2 + 50) {
    fill(cl1, cl2, cl3, 150);
  }
  textSize(100);
  text(b, sz2, height/2);


  Score Scores = new Score();
  Scores.Display();
}
