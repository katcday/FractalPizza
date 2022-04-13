//TITLE: Fractal Pizzaria
//AUTHOR: K. Camille Day
//DATE DUE: 2/28/22
//DATE SUBMITTED: 3/9/22
//COURSE TITLE: CSC202-H
//MEETING TIME(S): TTh 10:30-12:00
//DESCRIPTION: You have to select the right amount of pizza for the order.

// variables to switch screens
boolean mainscreen = true;
boolean game = false;
boolean end = false;
boolean clickedr = false;
boolean rules = false;

// fonts and image
PFont main;

// mainscreen variables
int startx = 400;
int starty = 300;
int rulesx= 400;
int rulesy = 355;

// pizza variable
int pizRad = 400;
int cRad = 400 - 30;
int px = 210;
int py = 390;

// color variables
color background = color(100, 135, 100);
color mainText = color(255, 255, 255);
color shadowText = color(245, 245, 245);
color buttons = color(100, 200, 100);
color shadButtons = color(70, 170, 70);
color pizzColor = color(249, 232, 186);
color dPizz = color(219, 202, 156);
color cheese = color(250, 238, 159);
color darkCheese = color(220, 208, 129);
color counter = color(182, 183, 184);
color order = color(253, 248, 226);
color gameText = color(178, 178, 178);
color deliver = color(255, 69, 69);
color dorder = color(223, 218, 196);
color ddeliver = color(225, 39, 39);
color mcolor = color(122, 229, 129);

// input variables
String input = "";
boolean entered;
int keyVal;

// game variables
boolean turnSet = false;
boolean turnOver = false;
int slices;
int numerator;
int money;
String monT = "0";
int clicked = 0;
boolean receipt = false;
int pizzasMade = 0;
int divisionFactor = 1;

ArrayList<Integer> sliceList;

void setup(){
  size(800, 600);
  main = loadFont("bigf.vlw");
  textFont(main, 100);
  textAlign(CENTER);
  
  strokeWeight(2);
  
  rectMode(CENTER);
  
  sliceList = new ArrayList<Integer>();
  
}

void draw() {
  // draw the background color
  background(background);
  if (mainscreen == true) {
    mainScreen();
  }
  else if (game == true) {
    // game here
    game();
  }
  else if (receipt == true) {
    receipt();
  }
}
