Robot r;
PImage field;

void setup() {
  size(720, 720);
  float Rpos = 360;
  String robotImage = "Mecanum Robot Blue.png";
  r = new Robot(Rpos,Rpos, robotImage);
  
  field = loadImage("Ultimate Goal Field 720x720.png");
}

void draw() {
  //background(255);
  image(field, 0,0);
  //r.move();
  r.update();
  r.display();
}

public void keyPressed(){
    if(keyCode == UP){
      r.setNormAcc(r.getNormAcc().x, r.getNormAcc().y-0.5);
    }
    if(keyCode == DOWN){
      r.setNormAcc(r.getNormAcc().x, r.getNormAcc().y+0.5);
    }
    if(keyCode == LEFT){
      r.setNormAcc(r.getNormAcc().x-0.5, r.getNormAcc().y);
    }
    if(keyCode == RIGHT){
      r.setNormAcc(r.getNormAcc().x+0.5, r.getNormAcc().y);
    }
    r.applyForce(r.getNormAcc());
  }
 
 void keyReleased(){
   r.decelerate();
 }
