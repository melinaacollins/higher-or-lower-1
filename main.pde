void setup(){
  size(800,500);
}

void draw(){
  background(#434343);
  
  textSize(16);
  fill(#FFFFFF);
  text("Play higher or lower?", 300, height/4);
  
  fill(#81FF79);
  rect(300,150,150,50);
  
  textSize(16);
  fill(#000000);
  text("Yes", 365, 180);
  
  fill(#FF7979);
  rect(300,215,150,50);
  
  textSize(16);
  fill(#00000);
  text("No", 365, 245);
}
