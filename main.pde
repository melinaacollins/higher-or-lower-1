/*
Opgaver
---------
1 - Implementer billeder
2 - Implementer higher or lower compare funktionen
3 - tilføje higher or lower knapper der virker
*/

JSONObject json;
PImage img;

//Global variables
boolean startScreen = true;
boolean loseScreen = false;
int score = 0;
int id1 = 1;
int id2 = 0;

//Yes button values
int rx1 = 325;
int ry1 = 150;
int rw1 = 150;
int rh1 = 50;
int bx1 = rx1+rw1;
int by1 = ry1+rh1;

//No button values
int rx2 = 325;
int ry2 = 215;
int rw2 = 150;
int rh2 = 50;
int bx2 = rx2+rw2;
int by2 = ry2+rh2;

String getStr(int x, String y){
  //Access json object
  json = loadJSONObject("gameData.json");
  JSONArray values = json.getJSONArray("companies");
  JSONObject company = values.getJSONObject(x);
  String val = company.getString(y);
  return(val);
}

int getInt(int x, String y){
  //Access json object
  json = loadJSONObject("gameData.json");
  JSONArray values = json.getJSONArray("companies");
  JSONObject company = values.getJSONObject(x);
  int val = company.getInt(y);
  return(val);
}

void setup(){
  size(800,400);
  
  id1 = (int) random(0,10);
  id2 = (int) random(0,10);
  
}

void draw(){
  background(#434343);
  
  if(startScreen == true && loseScreen == false){
    //Text
    textSize(16);
    fill(#FFFFFF);
    text("Play higher or lower?", width/2, height/4);
    textAlign(CENTER,CENTER);
    
    //Yes button
    fill(#81FF79);
    rect(rx1,ry1,rw1,rh1); 
    textSize(16);
    fill(#000000);
    textAlign(CENTER,CENTER);
    text("Yes", rx1+(rw1/2), ry1+(rh1/2));
    
    //No button
    fill(#FF7979);
    rect(rx2,ry2,rw2,rh2);
    textSize(16);
    fill(#000000);
    textAlign(CENTER,CENTER);
    text("No", rx2+(rw2/2), ry2+(rh2/2));
    
  }else if(startScreen == false && loseScreen == false){
    img = loadImage(getStr(id1,"path"));
    
    image(img, 0, 0);
    textSize(32);
    fill(#000000);
    text(getStr(id1, "name"), 200, height/2);

    textSize(16);
    fill(#000000);
    text("Has: " + getInt(id1, "viewerCount") + " Searches", 200, 225);
    
    
    img = loadImage(getStr(id2,"path"));
    image(img, 400, 0);
    textSize(32);
    fill(#000000);
    text(getStr(id2, "name"), 600, height/2);
    
    //Text
    textSize(16);
    fill(#FFFFFF);
    textAlign(RIGHT, BOTTOM);
    text("Score: " + score, width-20, height-10);
    
    line(width/2, height, width/2, height*-1);
    stroke(#030303);
    
    fill(#030303);
    circle(width/2, height/2, width/8);
    
    fill(#FF7979); 
    arc(width/2, height/2, 90, 90, radians(0), radians(180), PIE);
    fill(#000000);
    textAlign(CENTER,TOP);
    text("Lower", width/2, (height/2)+10);

    fill(#81FF79);
    arc(width/2, height/2, 90, 90, radians(180), radians(360), PIE);
    fill(#000000);
    textAlign(CENTER,BOTTOM);
    text("Higher", width/2, (height/2)-10);
   
  }else{
    //Text
    textSize(16);
    fill(#FFFFFF);
    text("Play again?", width/2, height/4);
    textAlign(CENTER,CENTER);
   
    //Yes button
    fill(#81FF79);
    rect(rx1,ry1,rw1,rh1); 
    textSize(16);
    fill(#000000);
    textAlign(CENTER,CENTER);
    text("Yes", rx1+(rw1/2), ry1+(rh1/2));
    
    //No button
    fill(#FF7979);
    rect(rx2,ry2,rw2,rh2);
    textSize(16);
    fill(#000000);
    textAlign(CENTER,CENTER);
    text("No", rx2+(rw2/2), ry2+(rh2/2));
  }
}

void mousePressed(){
  //If button 'yes' is clicked -> continue
  if(startScreen == true && loseScreen == false){
    if(mouseX < bx1 && mouseX > rx1 && mouseY < by1 && mouseY > ry1){
      startScreen = false;
      println("User pressed: Yes");
      
    //If button 'no' is clicked -> exit
    }else if(mouseX < bx2 && mouseX > rx2 && mouseY < by2 && mouseY > ry2){
      this.exit();
    }else{
      return;
    }
  }else if(startScreen == false && loseScreen == false){
    if(mouseX < (width/2)+45 && mouseX > (width/2)-45 && mouseY < by1 && mouseY > ry1){
      if(getInt(id1, "viewerCount") <= getInt(id2, "viewerCount")){
        id1 = id2;
        id2 = (int) random(0,10);
        score++;
      }else{
        print("False");
        loseScreen = true;
      }
      
    }else if(mouseX < (width/2)+45 && mouseX > (width/2)-45 && mouseY > height/2 && mouseY < (height/2)+45){
      if(getInt(id1, "viewerCount") >= getInt(id2, "viewerCount")){
        id1 = id2;
        id2 = (int) random(0,10);
        score++;
      }else{
        print("False");
        loseScreen = true;
      }
      
    }else{
      return;
    }
  }else{
    if(mouseX < bx1 && mouseX > rx1 && mouseY < by1 && mouseY > ry1){
      loseScreen = false;
      println("User pressed: Yes");
      
      score = 0; 
      id1 = (int) random(0,10);
      id2 = (int) random(0,10);
      
    //If button 'no' is clicked -> exit
    }else if(mouseX < bx2 && mouseX > rx2 && mouseY < by2 && mouseY > ry2){
      this.exit();
    }else{
      return;
    }
  }
}
