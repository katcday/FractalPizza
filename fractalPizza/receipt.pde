// creates a game summary
void receipt() {
  // draws rectangle
  color border;
  color btext;
  textAlign(CENTER);
  rectMode(LEFT);
  fill(order);
  rect(50, 50, 750, 550);
  
  fill(deliver);
  textFont(main, 70);
  
  // draws text
  text("You made: $" + money, 400, 130);
  text("And " + pizzasMade + " pizzas!", 400, 190);
  
  // detects collision for button
  // adds shading if hovering
  if (rectCollision(400, 500, 300, 70) == true) {
    border = dorder;
    btext = ddeliver;
  } else {
    border = order;
    btext = deliver;
  }
  
  // draws button to keep playing
  rectMode(CENTER);
  fill(border);
  rect(400, 500, 300, 70);
  fill(btext);
  textFont(main, 50);
  text("KEEP PLAYING", 400, 520);
  
  // collisions for receipt if pressed
  if (rectCollision(400, 500, 300, 70) == true && mousePressed == true) {
    receipt = false;
    game = true;
    delay(300);
  }
  
  
}
