class Robot{
  private PVector pos;
  private PVector vel;
  private PVector acc;
  private PImage rImage;
  private PVector normAcc;
  private float rSize;
  
  Robot(float x, float y, String r){
    rSize = 80;
    pos = new PVector(x-(rSize/2),y-(rSize/2));
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    rImage = loadImage(r.toString());
    normAcc = new PVector(0,0);
    
  }
  
  public void display(){
    
    image(rImage, pos.x, pos.y);
    
    //rect(pos.x, pos.y, 90,90);
  }
  
  public void applyForce(PVector force){
    acc.add(force);
  }
  public void boundary(){
    if(pos.x < 0){pos.x = 0;}
    if(pos.x > 720-rSize){pos.x = 720-rSize;}
    if(pos.y < 0){pos.y = 0;}
    if(pos.y > 720-rSize){pos.y = 720-rSize;}
  }
  public void velLimit(){
    if(vel.x > 2){vel.x = 2;}
    if(vel.y > 2){vel.y = 2;}
    if(vel.x < -2){vel.x = -2;}
    if(vel.y < -2){vel.y = -2;}
  }
  
  public void update(){
    vel.add(acc);
    velLimit();
    
    pos.add(vel);
    boundary();
    
    
    acc.mult(0);
    normAcc.mult(0);
    
  }
  
  public void decelerate(){
    while(vel.x !=0 && vel.y != 0){
      
    }
    if(vel.x > 0){
      acc.x = -1;
    }
    if(vel.x < 0){
      acc.x = 1;
    }
    if(vel.y > 0){
      acc.y = -1;
    }
    if(vel.y > 0){
      acc.y = 1;
    }
    
    acc.mult(0);
    normAcc.mult(0);
  }
  
  public void setNormAcc(float x, float y){
    normAcc.x=x;
    normAcc.y=y;
  }
  public PVector getNormAcc(){return normAcc;}
  
  
}
