class Pelota {
  
  float xpos; //posicion en x
  float ypos; //posicion en y
  float xvel; //velocidad en x
  float yvel; //velocidad en y
  int radio; //tamaño de la pelota
  
  Pelota(float posX, float posY, int tam){
    xpos = posX;
    ypos = posY;
    radio = tam;
    xvel = 0;
    yvel = 0;
  }
  
  void mover(float acX, float acY){
    xvel = xvel + 0.1*acX;
    yvel = yvel + 0.1*acY;
    xpos = xpos + 0.1*xvel;
    ypos = ypos + 0.1*yvel;
    if ((xpos <= 0+radio)||(xpos >= width-radio)){
      xvel = -0.8 * xvel;
    }
    if ((ypos <= 0+radio)||(ypos >= height-radio)){
      yvel = -0.8 * yvel;
    }    
  }

  void dibujar(){
    if (xpos < 0 + radio) {
      xpos = 0 + radio;
    }
    if (xpos > width - radio) {
      xpos = width - radio;
    }
    if (ypos < 0 + radio) {
      ypos = 0 + radio;
    }
    if (ypos > height - radio) {
      ypos = height - radio;
    }
    ellipse(xpos,ypos,radio,radio);
  }
}
