//Global variables
JSONObject json;

boolean startScreen = true;
int score = 0;
int id1;
int id2;

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

void getVal(int x, String y, String type){
  //Access json object
  json = loadJSONObject("gameData.json");
  JSONArray values = json.getJSONArray("companies");
  JSONObject company = values.getJSONObject(x);
  
  //Detects value type to avoid error
  if(type == "int"){
    int val1 = company.getInt(y);
    println(val1);
  }else if(type == "string"){
    String val2 = company.getString(y);
    println(val2);
  }else{
    println("Value doesn't exist");
  }
}

void setup(){
  size(1200,600);
}

void draw(){
  background(#434343);
  
  if(startScreen == true){
    //Text
    textSize(16);
    fill(#FFFFFF);
    text("Play higher or lower?", width/2, height/4);
    textAlign(CENTER,CENTER);
    
    //Yes button
    fill(#81FF79);
    rect(width-rw1,ry1,rw1,rh1); 
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
  }else{
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
  }
}

void mousePressed(){
  //If button 'yes' is clicked -> continue
  if(startScreen == true){
    if(mouseX < bx1 && mouseX > rx1 && mouseY < by1 && mouseY > ry1){
      startScreen = false;
      println("User pressed: Yes");
      
    //If button 'no' is clicked -> exit
    }else if(mouseX < bx2 && mouseX > rx2 && mouseY < by2 && mouseY > ry2){
      this.exit();
    }else{
      return;
    }
  }else{
  
  }
}
