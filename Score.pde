class Score{
/*  
  String[] Base_datos; 
  
  String Base_Datos = loadStrings("BaseDatos.txt");
  
  
  score (){
  
  
  
  
  }
  
  */
  
  PImage tabla = loadImage("tabla.png");
  
  int i = 1;
  
  void Display (){
  tabla.resize(450,180);
  String[] lineas = loadStrings("BaseDatos.txt");
  
   image(tabla, 375,384);
   textSize(20);
  
  for (String linea : lineas) {
    
    fill(255,255,255);
    
    String linea1 = split(linea, ",")[0];
    String linea2 = split(linea, ",")[1];
    

    text(linea1, 500, 500+30*(i%3));
    text(linea2, 500+130, 500+30*(i%3));
    this.i +=1;
    println();

  }
  
  }
  /*
  metodo ordenar{
    
  
  
  metodo actualizar record{
    
    
  }
 */ 
  
  
  

  



}
