void Elegir_Escenario () { /////////////////////////////////////////// SELECCION DEL ESCENARIO
  escenario[0] = loadImage("Escenario.jpg");
  escenario[0].resize(width, height);
  background(escenario[0]);
  
  escenario[1] = loadImage("bbl.jpg"); // Biblioteca
  biblio = loadImage("bibliotecaEsc.png");
  float biblioX = 100;
  float biblioY = height / 6;
  float biblioW = 350;
  float biblioH = 200;
  
  escenario[2] = loadImage("cse.jpg"); // Casa estudio
  casa = loadImage("casaestudioEsc.png");
  float casaX = 450;
  float casaY = 300;
  float casaW = 350;
  float casaH = 200;
  
  escenario[3] = loadImage("blqj.jpg"); // Bloque J
  bloque = loadImage("bloquejEsc.png");
  float bloqueX = 800;
  float bloqueY = 100;
  float bloqueW = 350;
  float bloqueH = 200;
  
  esc[0] = "Elige donde quieres jugar!!";
  textSize(20);
  fill(0);
  text(esc[0], 500, 20);
  
  PImage[] imagenes ={biblio, casa, bloque};
  float[] posX ={biblioX, casaX, bloqueX};
  float[] posY ={biblioY, casaY, bloqueY};
  float[] ancho ={biblioW, casaW, bloqueW};
  float[] alto ={biblioH, casaH, bloqueH};
  
  ////////////// CAMBIAR FONDO DEPENDIENDO ESCENARIO
  if (mouseX >=casaX & mouseX <= casaX +casaW & mouseY>= casaY & mouseY <=casaY+casaH) {
      background(escenario[2]);
    } else if (mouseX >=biblioX & mouseX <= biblioX + biblioW & mouseY>= biblioY & mouseY <= biblioY+biblioH){
      background(escenario[1]);
    } else if (mouseX >=bloqueX & mouseX <= bloqueX + bloqueW & mouseY>= bloqueY & mouseY <= bloqueY+bloqueH){
      background(escenario[3]);
    }
  
  
  for (int i= 0; i< imagenes.length; i++) { //////// Recorro las imagenes
    float x= posX[i];
    float y= posY[i];
    float w= ancho[i];
    float h= alto[i];
   
    image(imagenes[i], x, y, w, h);
  }
  
  
  atras = loadImage("atras.png");
  atras.resize(50, 50);
  image(atras, 1100, 10);
}
