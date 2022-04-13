// detects if mouse is hovering over a rectangel that was drawn with center mode on
boolean rectCollision(float rectX, float rectY, float rwidth, float rheight) {
  int nx = int(rectX - rwidth/2);
  int ny = int(rectY - rheight/2);
  
  if (mouseX > nx && mouseX < nx + rwidth && mouseY > ny && mouseY < ny + rheight) {
    return true;
  }
  else {
    return false;
  }
}

// detects if mouse is hovering over rectangle that was drawn with corner mode on
boolean cornRectColl(float rectX, float rectY, float rwidth, float rheight) {
  
  if (mouseX > rectX && mouseX < rectX + rwidth && mouseY > rectY && mouseY < rectY + rheight) {
    return true;
  }
  else {
    return false;
  }
}


// accepts input from the keyboard
void keyPressed() {
  if (key == '\n' ) {  
    // set guess to the value of the input
    if (input != "" && Integer.valueOf(input) < 17 && Integer.valueOf(input) >= 0) {
      
      keyVal = Integer.valueOf(input);
      
      // clear string after pressing enter
      input = "";
      // set entered to true so program knows key just entered
      entered = true;
    }
    else if (mainscreen == true) {
      entered = true;
    }
    else {
      input = "";
    }

  } else if (key == '0' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9') {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    // as soon as a key is hit we set entered to false
    entered = false;
    input = input + key; 
  } else if (key == 'r') {
    rules = !rules;
  }
}

boolean sliceCollide(float startAng, float endAng, int px, int py, int rad) {
  if (mouseX > px && mouseY > py) {
    // we need to find the distance of their hypotenuse
    // this is the distance between mouse and origin
    float hypotenuse = sqrt(sq(px - mouseX) + sq(py - mouseY));
    // distance between x of circle and mouse
    float a = abs(px - mouseX);
    float angle = acos(a / hypotenuse);
    /**println(angle);
    println("h" + hypotenuse);
    println("a" + a);**/
    if (angle > startAng && angle < endAng) {
      return true;
    }
  } else if (mouseX > px && mouseY < py) {
    // we need to find the distance of their hypotenuse
    // this is the distance between mouse and origin
    float hypotenuse = sqrt(sq(px - mouseX) + sq(py - mouseY));
    // distance between x of circle and mouse
    float a = abs(px - mouseX);
    float angle = acos(a/ hypotenuse);
    angle = HALF_PI - angle + (3 * PI) / 2;
    /**println(angle);
    println("h" + hypotenuse);
    println("a" + a);**/
    if (angle > startAng && angle < endAng) {
      return true;
    }
  } else if (mouseX < px && mouseY < py) {
    // we need to find the distance of their hypotenuse
    // this is the distance between mouse and origin
    float hypotenuse = sqrt(sq(px - mouseX) + sq(py - mouseY));
    // distance between x of circle and mouse
    float a = abs(px - mouseX);
    float angle = acos(a/ hypotenuse);
    angle = PI + angle;
    /**println(angle);
    println("h" + hypotenuse);
    println("a" + a);**/
    if (angle > startAng && angle < endAng) {
      return true;
    }
  } else if (mouseX < px && mouseY > py) {
    // we need to find the distance of their hypotenuse
    // this is the distance between mouse and origin
    float hypotenuse = sqrt(sq(px - mouseX) + sq(py - mouseY));
    // distance between x of circle and mouse
    float a = abs(px - mouseX);
    float angle = acos(a/ hypotenuse);
    angle = PI - angle;
    /**println(angle);
    println("h" + hypotenuse);
    println("a" + a);**/
    if (angle > startAng && angle < endAng) {
      return true;
    }
  }
  return false;
}

boolean pizzCollide(int px, int py, int diam) {
  // checks to see if the distance from the mouse to the radius is less than the radius
  if (sqrt(sq(px - mouseX) + sq(py - mouseY)) < diam/2) {
    return true;
  } else {
    return false;
  }
}


    
