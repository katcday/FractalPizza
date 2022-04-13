// game loop will consist of a customer ordering a pizza and the player having to select the correct amount of pizza
void game() {
  // colors
  textFont(main, 32);
  color aPizz;
  color aCheese;
  color btext;
  color border;
  
  boolean collide = false;
  boolean pcollide = false;
  
  
  // if the fraction hasn't been set we need to randomly select one
  // the number of pieces the pizza will have
  if (turnSet == false) {
    // set arraylist to hold a 0 for every slice in the pizza
    slices = int(random(2, 5));
    numerator = int(random(2, slices - 1));
    
    // add a 0 for every slice
    for (int i = 0; i < slices; i++) {
      sliceList.add(0);
      sliceList.set(i, 0);
    }
    // use simplify to find number that divides numerator and denominator
    divisionFactor = simplify(numerator, slices);
    print(divisionFactor);
    
    // we don't want it to keep randomizing until the turn is over
    turnSet = true;
  }
  
  // check for pizza collision
  if (pizzCollide(px, py, pizRad) == true) {
    pcollide = true;
  }
  
  
  
  // draw our counter
  fill(counter);
  rectMode(CORNER);
  rect(0, 170, 800, 600);
  
  
  
  // displays the order
  stroke(gameText);
  fill(order);
  rect(0, 0, 500, 100);
  textAlign(LEFT);
  fill(gameText);
  text("Order:", 10, 30);
  // display simplified fraction
  text(str(numerator / divisionFactor), 120, 30);
  line(115, 35, 150, 35);
  text(str(slices/ divisionFactor), 120, 65);
  text("of the pizza", 170, 30);
  
  // the number of pieces the pizza will have
  stroke(0, 0, 0);
  // reset start position of the slices
  float lastAng = 0;
  // divides the arc length by the amount of slices to find out how many radians it will rotate by
  float nextAng = lastAng + (2 * PI)/slices;
  // go through amount of slices and draw an arc for each slice
  for (int piece = 0; piece < slices; piece++) {
    
    // check to see if collision with slice
    if(sliceCollide(lastAng, nextAng, px, py, 10) == true && pcollide == true) {
      aCheese = darkCheese;
      aPizz = dPizz;
      collide = true;
    } 
    else {
      aCheese = cheese;
      aPizz = pizzColor;
    }
    
    // is the mouse if pressed and collision is true, then we change it to 1 in list
    if (mousePressed == true && collide == true) {
      sliceList.set(piece, 1);
      collide = false;
      
      // we also add it to our counter
      clicked += 1;
      delay(300);
    }
    println(piece);
    
    if (sliceList.get(piece) == 0) {
      fill(aPizz);
      arc(px, py, pizRad, pizRad, lastAng, nextAng, PIE);
      fill(aCheese);
      arc(px, py, cRad, cRad, lastAng, nextAng, PIE);
    }

    
    
    // set start and stop angle
    lastAng = nextAng;
    nextAng = lastAng + (2 * PI)/slices;
  }
  
    
  // reset
  lastAng = 0;
  
  // we have to make a deliver button
  fill(order);
  rect(500, 500, 250, 80);
  fill(deliver);
  textFont(main, 70);
  text("DELIVER", 502, 565);
  
  
  
  if (cornRectColl(500, 500, 250, 80) == true) {
    border = dorder;
    btext = ddeliver;
  } else {
    border = order;
    btext = deliver;
  }
  
  // we have to make a deliver button
  fill(border);
  rect(500, 500, 250, 80);
  fill(btext);
  textFont(main, 70);
  text("DELIVER", 502, 565);
  
  // collisions for deliver button
  if (cornRectColl(500, 500, 250, 80) == true && mousePressed == true) {
    turnSet = false;
    
    // we check to see if the correct amount of pizza was given
    if (numerator == clicked) {
      money += clicked;
      pizzasMade += 1;
    } else if (numerator < clicked) {
      money -= clicked;
    } else {
      money -= clicked;
    }
    monT = str(money);
    
    delay(300);
    clicked = 0;
  }
  
  if (cornRectColl(500, 400, 250, 80) == true) {
    border = dorder;
    btext = ddeliver;
  } else {
    border = order;
    btext = deliver;
  }
  // we have to make a end game button
  fill(border);
  rect(500, 400, 250, 80);
  fill(btext);
  textFont(main, 60);
  text("GET PAID", 502, 465);
  
  textFont(main, 40);
  fill(order);
  rect(700, 10, 90, 50);
  fill(mcolor);
  text(monT, 715, 50);
  
  // collisions for receipt
  if (cornRectColl(500, 400, 250, 80) == true && mousePressed == true) {
    receipt = true;
    game = false;
    delay(300);
  }
  
  
  
  
}
