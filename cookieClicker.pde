// Zach Fauser
// Assignment 3 - Processing (Cookie Clicker)
// September 27, 2022
PImage cookie;
int cookies = 0;

// Setup Method
void setup() {
  size(400, 400);
  background(0);
  fill(255);
  textSize(20);
  cookie = loadImage("cookie.png");
  text("You have " + cookies + " cookies!", 10, 30);
}

// Draw Method
void draw() {
  // Draw the cookie
  image(cookie, 100, 100, 200, 200);
}

// Mouse Pressed Method
void mousePressed() {
  if (mouseX > 100 && mouseX < 300 && mouseY > 100 && mouseY < 300) {
    cookies++;
    // clear previous text
    fill(0);
    // draw rectangle to cover previous text
    rect(0, 0, 400, 30);
    // draw new text
    fill(255);
    text("You have " + cookies + " cookies!", 10, 30);
  }
}
