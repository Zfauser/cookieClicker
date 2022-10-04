// Zach Fauser
// Assignment 3 - Processing (Cookie Clicker)
// September 27, 2022

PImage cookie;
PImage grannyColor;
PImage grannyBW;
PImage cursorColor;
PImage cursorBW;
float cookies = 0.0; // declare cookies variable
int i = 1; // declare 1 variable
int cookieX = 100;
int cookieY = 100;
int cookieW = 200;
int cookieH = 200;
int cookiesNeeded = 10;
int clicksPerSecond = 0;

// Setup Method
void setup() {
  frameRate(60); // set frame rate to 60
  cookie = loadImage("cookie0.png"); // load cookie0.png
  grannyColor = loadImage("grannyColor.png"); // load grannyColor.png
  grannyBW = loadImage("grannyBW.png"); // load grannyBW.png
  cursorBW = loadImage("cursorBW.png"); // load cursorBW.png
  cursorColor = loadImage("cursorColor.png"); // load cursorColor.png
  size(400, 400); // set size of window
  background(0); // set background color
  fill(255); // set fill color
  textSize(20); // set text size
  text("You have " + cookies + " cookies!", 10, 30); // display inital cookies value
  image(cookie, cookieX, cookieY, cookieW, cookieH); // Draw the cookie
}


// Draw Method
void draw() {
  cookies = cookies + clicksPerSecond * 1/60.0; // print cookies value
  drawAssets(); // call drawAssets method
}

// Mouse Pressed Method
void mousePressed() {
  if (mouseX > 100 && mouseX < 300 && mouseY > 100 && mouseY < 300) { // if mouse is pressed within the cookie
    cookieX = cookieX - 5;
		cookieY = cookieY - 5;
		cookieH = cookieH + 10;
		cookieW = cookieW + 10;
    cookies++; // increment cookies variable by 1
    cookies = cookies + clicksPerSecond * 1/60; // calculate cookies per second
  }
  else if (mouseX > 0 && mouseX < 300 && mouseY > 0 && mouseY < 400) { // if mouse is pressed within the granny
    if (cookies >= cookiesNeeded) { // if cookies is greater than or equal to cookiesNeeded
      clicksPerSecond++; // increment clicksPerSecond by 1
      cookies = cookies - cookiesNeeded; // subtract cookiesNeeded from cookies
      cookiesNeeded = cookiesNeeded + 10; // multiply cookiesNeeded by 2
      fill(0); // set fill color to black
      rect(100, 300, 200, 100); // draw rectangle to cover previous granny
      image(grannyBW, 0, 300, 100, 100); // draw black and white granny
      fill(255); // set fill color to white
      println(clicksPerSecond); // print clicksPerSecond to console
    }
  }
}
//Cookie gets larger when you click it.
void mouseReleased() {
	if(mouseX > cookieX && mouseX < cookieX + cookieW && mouseY > cookieY && mouseY < cookieY + cookieH) {
		cookieX = cookieX + 5;
		cookieY = cookieY + 5;
		cookieH = cookieH - 10;
		cookieW = cookieW - 10;
	}
}

void drawAssets() {
  // draw rectangle to cover previous text
  fill(0);
  rect(0, 0, 400, 30);
  // draw text
  fill(255);
  text("You have " + (round((cookies * 10.0)) / 10.0) + " cookies!", 10, 30);
  // underneath this line, draw the cps text
  fill(0);
  rect(0, 30, 400, 30);
  fill(255);
  text("You have " + clicksPerSecond + " cps!", 10, 60);
  // draw the cookie
  // draw rectangle to cover previous cookie
  fill(0);
  rect(cookieX, cookieY, cookieW, cookieH);
	noStroke();
	image(cookie, cookieX, cookieY, cookieW, cookieH);
  // draw rectangle to cover previous granny
  fill(0);
  rect(0, 300, 400, 100);
  // draw granny
  if (cookies >= cookiesNeeded) { // if cookies is greater than or equal to 10
    image(grannyColor, 0, 300, 100, 100); // draw color granny
  } else { // otherwise
    image(grannyBW, 0, 300, 100, 100); // draw black and white granny
  }
  // draw text beside granny to show how many cookies are needed
  fill(255);
  text(cookiesNeeded + " cookies", 10, 295);
}