void iniciarMusicaMenu() {
  Menú = new SoundFile(this, "MenuCancion.mp3");
  Menú.amp(0.3); // Volumen
  Menú.rate(1); // Velocidad
  Menú.loop();
  MusicaPlaying = true;
}

void detenerMusicaMenu() {
  if (MusicaPlaying) {
    Menú.stop();
    MusicaPlaying = false;
  }
}

void iniciarMusicaJuego() {
  if (juego == null) {
    juego = new SoundFile(this, "MarioCanción.mp3");
    juego.amp(0.3); // Volumen
    juego.rate(1); // Velocidad
    juego.loop();
  }
}

void CoinRecogida() {
  if(!CoinPlaying){
 coin = new SoundFile(this, "SonidoCoin.mp3");
 coin.amp(0.3); // Volumen
 coin.rate(1); // Velocidad
 coin.play();
 CoinPlaying=true;
  }
}

void ColisionSonido() {
  if(!ColisionPlaying){
 colision = new SoundFile(this, "SonidoExplosion.mp3");
 colision.amp(0.3); // Volumen
 colision.rate(1); // Velocidad
 colision.play();
 ColisionPlaying=true;
  }
}

void click (){
  click = new SoundFile(this, "SonidoGolpe.mp3");
 click.amp(0.3); // Volumen
 click.rate(1); // Velocidad
 click.play();
  
}
