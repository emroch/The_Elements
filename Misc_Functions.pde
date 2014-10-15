// Sets all page flags to false and makes the input screen's flag true.
void setScreens(int page) {
  for (int i = 0; i < screens.length; i++) screens[i] = false;
  screens[page] = true;
}

void checkButtons() {
  /*  If something was clicked on while not on the home screen, check if it was
      either of the buttons. Set the position accordingly and call drawButtons
      to update their positions */
  if (!screens[HOME] && mousePressed) {
    if (isMouseInside(25, 25, 50, 50))       homePressed = true;
    else if (isMouseInside(90, 25, 120, 50)) backPressed = true;
    else {
      homePressed = backPressed = false;
      delay(150);
    }
  }
  drawButtons();
}

void drawButtons() {
  if (!screens[HOME]) {
    if (homePressed) {
      fill(155); rect(25, 25, 50, 55); // Rectangle to cover up the button
      image(homeButton, 50, 55);       // Then draw the button slightly lower 
    }
    else if (backPressed) {
      fill(155); rect(90, 25, 120, 55); // Rectangle to cover up the button
      image(backButton, 150, 55);       // Then draw the button slightly lower
    }
    else {
    /*  Draw both buttons in the up positions and draw a small rectangle under
        them to create a "shadow". */
      image(homeButton, 50, 50);
      image(backButton, 150, 50);
      fill(50);         rect(25, 75, 50, 5);
      fill(0, 64, 140); rect(90, 75, 120, 5);
    }
  }
}

// Returns true if the mouse is in the rectangle specified by x, y, w, and h
Boolean isMouseInside(float x, float y, float w, float h) {
  return mouseX >= x & mouseX < x+w & mouseY >= y & mouseY < y+h;
}

// If verbose is set to true, this will output debugging information
// Verbose is toggled using the key combination "ALT-D"
void debug(Boolean verbose) {
  if (verbose) {
    println("The mouse is over " + mouseOver);
    println("The mouse is at " + mouseX + ", " + mouseY);

    println();
    println("Boolean Screen Values:");
    printArray(screens);

    println();
    println("transitionFlag = " + transitionFlag);
    println("Next Page: " + nextPage);

    println();
    String frate = nf(frameRate, 2, 2);
    println("Frame " + frameCount + " @ " + frate + " fps");
    println("====================================");
  }
}