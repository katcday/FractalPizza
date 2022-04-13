// displays graphics for the mainscreen
// handles buttons and the shading
void mainScreen() {
  fill(mainText);
  textFont(main, 100);
  text("Fractal Pizzaria", 400, 200);
  
  // now we need a start and rules button
  textFont(main, 32);
  fill(buttons);
  rect(startx, starty, 100, 50);
  fill(mainText);
  text("Start", startx, starty + 15);
  fill(buttons);
  rect(rulesx, rulesy, 100, 50);
  fill(mainText);
  text("Rules", rulesx, rulesy + 15);
  
  if (rectCollision(startx, starty, 100, 50)) {
    fill(shadButtons);
    rect(startx, starty, 100, 50);
    fill(shadowText);
    text("Start", startx, starty + 15);
  }
  else if (rectCollision(rulesx, rulesy, 100, 50)){
    fill(shadButtons);
    rect(rulesx, rulesy, 100, 50);
    fill(shadowText);
    text("Rules", rulesx, rulesy + 15);
  }
    
  
  // handle input of start and rules
  if (mousePressed == true) {
    if (rectCollision(startx, starty, 100, 50)) {
      mainscreen = false;
      game = true;
      delay(205);
    }
    else if (rectCollision(rulesx, rulesy, 100, 50)) {
      rules = !rules;
      delay(200);
    }
  }
  
  // show rules
  if (rules == true) {
    text("Select the amount of pizza the customer asked for,", 400, 500);
    text("then click deliver!", 400, 550);
  }
    
}
