

class Score{

  String Nombres_Displays[]= new String[3];
  int  Scores[]= new int[3];
  int i = 0;
  
  Score (){
   String[] lineas = loadStrings("BaseDatos.txt");
  for (String linea : lineas) {

    String linea1 = split(linea, ",")[0];
    Nombres_Displays[i]= linea1;
    String linea2 = split(linea, ",")[1];
    Scores[i]= int(linea2);
    this.i +=1;

  }
  
  this.i=0;
 
  
  }
  
  

  
  PImage tabla = loadImage("tabla.png");
  

  
  void Display (){
  String[] lineas = loadStrings("BaseDatos.txt");
  for (String linea : lineas) {

    String linea1 = split(linea, ",")[0];
    Nombres_Displays[i]= linea1;
    String linea2 = split(linea, ",")[1];
    Scores[i]= int(linea2);
    this.i +=1;

  }
  this.i=0;
 
    
    
    
    ordenar();
    
  tabla.resize(450,180);
   image(tabla, /*375*/width-450-10,384);
   textSize(20);
  
  int n = Scores.length;
  for (int i = 0; i <= n-1; i++) {
    
    fill(255,255,255);
   
    

    text(Nombres_Displays[i], width-450+75-10, 455+40*(i%3));
    text(Scores[i], width-450+315-10, 455+40*(i%3));
  }
  
  }

 
  void ordenar(){
    
    int n = Scores.length;
    for (int i = 0; i < n-1; i++) {
      for (int j = 0; j < n-i-1; j++) {
        if (Scores[j]<  Scores[j+1]) {
        int copia = Scores[j];
        Scores[j] = Scores[j+1];
        Scores[j+1] = copia;
        
        String copiaNombre = Nombres_Displays[j];
        Nombres_Displays[j] = Nombres_Displays[j+1];
        Nombres_Displays[j+1] = copiaNombre;
        
        }}}

  }
  
  void actualizar( String name,int N_Coin){
    
    int n = Scores.length;
    for (int i = 0; i <= n-1; i++) {
      println(EliminarEspacios(Nombres_Displays[i]));
      println(name);
      if (EliminarEspacios(Nombres_Displays[i]).equals(name)){
        println("ggggggg");
        Scores[i]=N_Coin;
        println("ggggggg", Scores[i]);
      }}
      
      ordenar();
      
      println(Scores);
      println(Nombres_Displays);
      
      
      
      
      
  PrintWriter writer = createWriter("BaseDatos.txt");
  

  
      for (int i = 0; i < n; i++) {
        println(Nombres_Displays[i]+","+Scores[i],"rrrrrrrrrrrrrrrr");
         writer.println(Nombres_Displays[i]+","+Scores[i]);
     }
 
  
 
  writer.flush(); 
  writer.close();
  
    
  }
  
  String EliminarEspacios(String palabra) {
  int j = 0;
  while (j  < palabra.length() && palabra.charAt(j) == ' ') {
    j++;
  }
  println(palabra.substring(j)=="Alexander");
  return palabra.substring(j);
}
  
  
  
  
  
  

  



}
