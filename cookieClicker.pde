// Name: Zach Fauser
// Assignment: Assignment 3 - Processing (Cookie Clicker)
// Purpose: To create a cookie clicker game using Processing
// Start Date: September 27, 2022

PImage cookie; // Declares the cookie image
PImage grannyColor; // Declares the granny color image
PImage grannyBW; // Declares the granny black and white image
PImage cursorColor; // Declares the cursor color image
PImage cursorBW; // Declares the cursor black and white image
float cookies = 0.0; // declare cookies variable
int i = 1; // declare 1 variable
int cookieX = 100; // declare cookie x variable
int cookieY = 100; // declare cookie y variable
int cookieW = 200; // declare cookie width variable
int cookieH = 200; // declare cookie height variable
int cookiesNeededGranny = 10; // declare cookies needed for granny variable
int cookiesNeededCursor = 10; // declare cookies needed for cursor variable
int clicksPerSecond = 0; // declare clicks per second variable
int cookiesPerClick = 1; // declare cookies per click variable


// Setup Method
void setup() {
  frameRate(60); // set frame rate to 60
  cookie = loadImage("cookie0.png"); // load cookie0.png
  grannyColor = loadImage("grannyColor.png"); // load grannyColor.png
  grannyBW = loadImage("grannyBW.png"); // load grannyBW.png
  cursorBW = loadImage("cursorBW.png"); // load cursorBW.png
  cursorColor = loadImage("cursorColor.png"); // load cursorColor.png
  size(400, 400); // set size of window
  surface.setTitle("Cookie Clicker"); // set title of window
  background(75, 172, 198); // set background color
  fill(255); // set fill color
  textSize(20); // set text size
  text("You have " + cookies + " cookies!", 10, 30); // display inital cookies value
  image(cookie, cookieX, cookieY, cookieW, cookieH); // Draw the cookie
  stroke(75, 172, 198); // set stroke color
}


// Draw Method
void draw() {
  cookies = cookies + clicksPerSecond * 1/60.0; // print cookies value
  drawAssets(); // call drawAssets method
}

// Mouse Pressed Method
void mousePressed() {
  if (mouseX > 100 && mouseX < 300 && mouseY > 100 && mouseY < 300) { // if mouse is pressed within the cookie
    cookieX = cookieX - 5; // move cookie x position left
		cookieY = cookieY - 5; // move cookie y position up
		cookieH = cookieH + 10; // make cookie higher by 10
		cookieW = cookieW + 10; // make cookie wider by 10
    cookies += cookiesPerClick; // add cookiesPerClick to cookies
    cookies = cookies + clicksPerSecond * 1/60; // calculate cookies per second
  }
  else if (mouseX > 0 && mouseX < 300 && mouseY > 0 && mouseY < 400) { // if mouse is pressed within the granny
    if (cookies >= cookiesNeededGranny) { // if cookies is greater than or equal to cookiesNeededGranny
      clicksPerSecond++; // increment clicksPerSecond by 1
      cookies = cookies - cookiesNeededGranny; // subtract cookiesNeededGranny from cookies
      cookiesNeededGranny = cookiesNeededGranny + 10; // multiply cookiesNeededGranny by 2
      fill(75, 172, 198); // set fill color to black
      rect(100, 300, 200, 100); // draw rectangle to cover previous granny
      image(grannyBW, 0, 300, 100, 100); // draw black and white granny
      fill(255); // set fill color to white
    }
  }
  else if (mouseX > 300 && mouseX < 400 && mouseY > 0 && mouseY < 400) { // if mouse is pressed within the cursor
    if (cookies >= cookiesNeededCursor) { // if cookies is greater than or equal to cookiesNeededCursor
      cookiesPerClick++; // increment cookiesPerClick by 1
      cookies = cookies - cookiesNeededCursor; // subtract cookiesNeededCursor from cookies
      cookiesNeededCursor = cookiesNeededCursor + 10; // multiply cookiesNeededCursor by 2
      fill(75, 172, 198); // set fill color to black
      rect(300, 300, 100, 100); // draw rectangle to cover previous cursor
      image(cursorBW, 300, 300, 100, 100); // draw black and white cursor
      fill(255); // set fill color to white
    }
  }
}

// Key Pressed Method
void keyPressed() {
  if (key == 'g') { // if g is pressed
    if (cookies >= cookiesNeededGranny) { // if cookies is greater than or equal to cookiesNeededGranny
      clicksPerSecond++; // increment clicksPerSecond by 1
      cookies = cookies - cookiesNeededGranny; // subtract cookiesNeededGranny from cookies
      cookiesNeededGranny = cookiesNeededGranny + 10; // multiply cookiesNeededGranny by 2
      fill(75, 172, 198); // set fill color to black
      rect(100, 300, 200, 100); // draw rectangle to cover previous granny
      image(grannyBW, 0, 300, 100, 100); // draw black and white granny
      fill(255); // set fill color to white
    }
  }
  else if (key == 'c') { // if c is pressed
    if (cookies >= cookiesNeededCursor) { // if cookies is greater than or equal to cookiesNeededCursor
      cookiesPerClick++; // increment cookiesPerClick by 1
      cookies = cookies - cookiesNeededCursor; // subtract cookiesNeededCursor from cookies
      cookiesNeededCursor = cookiesNeededCursor + 10; // multiply cookiesNeededCursor by 2
      fill(75, 172, 198); // set fill color to black
      rect(300, 300, 100, 100); // draw rectangle to cover previous cursor
      image(cursorBW, 300, 300, 100, 100); // draw black and white cursor
      fill(255); // set fill color to white
    }
  }
}

// Cookie gets larger when you click it.
void mouseReleased() {
	if(mouseX > cookieX && mouseX < cookieX + cookieW && mouseY > cookieY && mouseY < cookieY + cookieH) {
		cookieX = cookieX + 5; // move cookie x position right
		cookieY = cookieY + 5; // move cookie y position down
		cookieH = cookieH - 10; // make cookie shorter by 10
		cookieW = cookieW - 10; // make cookie narrower by 10
	}
}

void drawAssets() {
  // draw rectangle to cover previous text
  fill(75, 172, 198);
  rect(0, 5, 400, 30);
  fill(255);
  text("You have " + (round((cookies * 10.0)) / 10.0) + " cookie(s)!", 10, 30);
  // underneath this line, draw the cps text
  fill(75, 172, 198);
  rect(0, 35, 400, 30);
  fill(255);
  text("You have " + clicksPerSecond + " click(s) per second! (cps)", 10, 60);
  // draw rectangle to cover previous text
  fill(75, 172, 198);
  rect(0, 70, 400, 40);
  fill(255);
  // draw text
  text("You get " + cookiesPerClick + " cookie(s) per click! (cpc)", 10, 90);
  // draw rectangle to cover previous cookie
  fill(75, 172, 198);
  rect(cookieX, cookieY, cookieW, cookieH);
  // draw the cookie
	noStroke();
	image(cookie, cookieX, cookieY, cookieW, cookieH);
  // draw rectangle to cover previous granny
  fill(75, 172, 198);
  rect(0, 300, 400, 100);
  // draw granny
  if (cookies >= cookiesNeededGranny) { // if cookies is greater than or equal to cookiesNeeded
    image(grannyColor, 0, 300, 100, 100); // draw color granny
  } else { // otherwise
    image(grannyBW, 0, 300, 100, 100); // draw black and white granny
  }
  // draw rectangle to cover previous text
  fill(75, 172, 198);
  rect(10, 280, 120, 20);
  // draw text beside granny to show how many cookies are needed
  fill(255);
  text("Cost: " + cookiesNeededGranny, 7, 295);
  // draw rectangle to cover previous cursor
  fill(75, 172, 198);
  rect(300, 300, 100, 100);
  if (cookies >= cookiesNeededCursor) { // if cookies is greater than or equal to cookiesNeeded
    image(cursorColor, 300, 300, 100, 100); // draw color cursor
  } else { // otherwise
    image(cursorBW, 300, 300, 100, 100); // draw black and white cursor
  }
  // draw rectangle to cover previous text
  fill(75, 172, 198);
  rect(280, 280, 120, 20);
  // draw text beside cursor to show how many cookies are needed
  fill(255);
  text("Cost: " + cookiesNeededCursor, 300, 295); // display cookiesNeeded
  // draw instructions
  text("g to buy a granny", 125, 320);
  text("c to buy a cursor", 125, 340);
  text("granny = cps", 125, 360);
  text("cursor = cpc", 125, 380);
}
