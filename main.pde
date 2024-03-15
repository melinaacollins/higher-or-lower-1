boolean startScreen = true;

void setup(){
  size(800,500);
}

void draw(){
  background(#434343);
  
  if(startScreen == true){
    //Text
    textSize(16);
    fill(#FFFFFF);
    text("Play higher or lower?", 300, height/4);
    
    //Yes button
    fill(#81FF79);
    rect(300,150,150,50);
        
    textSize(16);
    fill(#000000);
    text("Yes", 365, 180);
    
    //No button
    fill(#FF7979);
    rect(300,215,150,50);
    //  (x,   y,   width, height);
    
    textSize(16);
    fill(#000000);
    text("No", 365, 245);
  }else{
    
  }
}

void mousePressed(){
  if(mouseX < 450 && mouseX > 300 && mouseY < 200 && mouseY > 150){
    startScreen = false;
    println("User pressed: Yes");
  }else if(mouseX < 450 && mouseX > 300 && mouseY < 265 && mouseY > 215){
    this.exit();
  }else{
    return;
  }
}
