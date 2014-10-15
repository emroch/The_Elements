// If the mouse was pressed, check the buttons
void mousePressed() {
  if (isFinishedLoading && !inProgress) checkButtons();
}

// When the mouse is released do something based on where it is...
void mouseReleased() {
  if (isFinishedLoading && !inProgress) {
    if (homePressed) {                      // If the home button was pressed:
      homePressed = false;                    // Reset the button state,
      setScreens(HOME);                       // Set the home screen as active,
      nextPage = currentPage = homeScreen;    // Set current and next page,
      transitionFlag = 'F';                   // Fade homeScreen in
    }
    else if (backPressed) {                 // If the back button was pressed:
      backPressed = false;                    // Reset the button state.
      if (screens[PICTURES]) {                // If on a pictures screen:
        nextPage = homeScreen;                  // The next page is home,
        transitionFlag = 'b';                   // so lets go there,
        setScreens(HOME);                       // and announce we have arrived
      } else if (page == "hydrogen") {        // If on the hydrogen page:
        nextPage = homeScreen;                  // The next page is home,
        transitionFlag = 'u';                   // so lets go there,
        setScreens(HOME);                       // and announce we have arrived
      } else if (screens[CREDITS]) {          // If on a credits page:
        nextPage = homeScreen;                  // The next page is home,
        transitionFlag = 'v';                   // so lets go there,
        setScreens(HOME);                       // and announce we have arrived
      } else if (screens[INFO]) {             // If on an element's info page, things start to get serious
        if (page == "transitionMetals") {                              // If we're looking at a transition metal:
          if (transitionMetalPage == 1)      nextPage = groupPics[2];    // Return to the correct transition metal page
          else if (transitionMetalPage == 2) nextPage = groupPics[3];
          else if (transitionMetalPage == 3) nextPage = groupPics[4];
          else if (transitionMetalPage == 4) nextPage = groupPics[5];
          else if (transitionMetalPage == 5) nextPage = groupPics[6];
        } else if (page == "nonMetals") {                              // If we're looking at a nonmetal:
          if (nonmetalPage == 1)      nextPage = groupPics[8];           // return to the correct nonmetal page
          else if (nonmetalPage == 2) nextPage = groupPics[9];
        } else if (page == "rareEarths") {                             // If we're looking at a rare earth metal:
          if (rareEarthPage == 1) nextPage = groupPics[12];              // return to the correct rare earth page
          else if (rareEarthPage == 2) nextPage = groupPics[13];
          else if (rareEarthPage == 3) nextPage = groupPics[14];
        } else {                                                       // For everything else, there is only one choice,
          if (page == "alkali")             nextPage = groupPics[0];
          else if (page == "alkalineEarth") nextPage = groupPics[1];
          else if (page == "metals")        nextPage = groupPics[7];
          else if (page == "halogens")      nextPage = groupPics[10];
          else if (page == "nobleGases")    nextPage = groupPics[11];
        }
        transitionFlag = 'u';       // These transitions all use 're-cover'
        setScreens(PICTURES);       // Let's announce our arrival
      } else if (screens[SUBCREDITS]) {                       // If on a subcredit page,
        if (creditsPage == 1)      nextPage = creditPics[0];  // we have to choose which credits to go back to
        else if (creditsPage == 2) nextPage = creditPics[1];
        else if (creditsPage == 3) nextPage = creditPics[2];
        else if (creditsPage == 4) nextPage = creditPics[3];
        else if (creditsPage == 5) nextPage = creditPics[4];
        else if (creditsPage == 6) nextPage = creditPics[5];
        else if (creditsPage == 7) nextPage = creditPics[6];
        else if (creditsPage == 8) nextPage = creditPics[7];
        transitionFlag = 'F';        // These transitions all use 'fade'
        setScreens(CREDITS);         // Lets announce our arrival
      }
    } else {              // If neither button was pushed, we must have clicked on something!
      checkLocation();    // Let's find out what it was!
    }
  }
}

// Recheck to see if mouse is still over a button
void mouseDragged() {
  if (isFinishedLoading && !inProgress) {
    if (homePressed || backPressed) checkButtons();
  }
}

// Check if the mouse is over anything
void mouseMoved() {
  mouseOver = mouseLocation(); // Cursor style is updated in draw()
}

// Hotkeys for toggling debugging output (ALT+D)
void keyPressed() {
  if (keyCode == ALT) altPressed = true;
  else if ((key == 'd' || key == 'D') && altPressed == true) verbose = !verbose;
}

void keyReleased() {
  if (keyCode == ALT) altPressed = false;
}

// Checks the location of the mouse and sets a string describing where it is
String mouseLocation() {
  mouseOver = null;       // Starts by erasing anything thats already there
  if (isFinishedLoading && !inProgress) {   // If done loading and not alreading animating...
    if (screens[HOME]) {                      // If on the home screen, check the color under the cursor
      float redVal = red(homeScreen.get(mouseX, mouseY));   // Red value of the pixel at (mouseX, mouseY)
      if (redVal == 163) mouseOver = "Hydrogen";            // Each section has a unique red channel
      else if (redVal == 230) mouseOver = "Alkali";         // So there is only one choice for each value
      else if (redVal == 250) mouseOver = "Alkaline Earth";
      else if (redVal == 75) mouseOver = "Transition";
      else if (redVal == 221) mouseOver = "Metals";
      else if (redVal == 137) mouseOver = "Non Metals";
      else if (redVal == 212) mouseOver = "Halogens";
      else if (redVal == 13) mouseOver = "Noble Gas";
      else if (redVal == 24) mouseOver = "Rare Earth";
      else if (dist(mouseX, mouseY, 1000, 600) <= 25) mouseOver = "Credits";  // Mouse is over info button
    } else {
      // If not on the home page, check the buttons
      if (isMouseInside(25, 25, 50, 50)) mouseOver = "Home Button";
      else if (isMouseInside(90, 25, 190, 50)) mouseOver = "Back Button";

      if (screens[PICTURES]) {
        // Determine if the mouse is over an element picture.  Separated because metals have 8, others have 6
        if (page == "metals") {
          if (isMouseInside(73, 130, 200, 200))       mouseOver = "Element 1";
          else if (isMouseInside(324, 130, 200, 200)) mouseOver = "Element 2";
          else if (isMouseInside(575, 130, 200, 200)) mouseOver = "Element 3";
          else if (isMouseInside(826, 130, 200, 200)) mouseOver = "Element 4";
          else if (isMouseInside(73, 395, 200, 200))  mouseOver = "Element 5";
          else if (isMouseInside(324, 395, 200, 200)) mouseOver = "Element 6";
          else if (isMouseInside(575, 395, 200, 200)) mouseOver = "Element 7";
          else if (isMouseInside(826, 395, 200, 200)) mouseOver = "Element 8";
        } else {
          if (isMouseInside(134, 130, 200, 200))      mouseOver = "Element 1";
          else if (isMouseInside(448, 130, 200, 200)) mouseOver = "Element 2";
          else if (isMouseInside(766, 130, 200, 200)) mouseOver = "Element 3";
          else if (isMouseInside(134, 395, 200, 200)) mouseOver = "Element 4";
          else if (isMouseInside(448, 395, 200, 200)) mouseOver = "Element 5";
          else if (isMouseInside(766, 395, 200, 200)) mouseOver = "Element 6";
          // Overrides original position because halogens have only 5 elements
          if (page == "halogens") {
            if (isMouseInside(292, 395, 200, 200))      mouseOver = "Element 4";
            else if (isMouseInside(608, 395, 200, 200)) mouseOver = "Element 5";
          }
        }

        // For multi-page groups, determine if mouse is over page selector
        if (page == "transitionMetals") {
          if (dist(mouseX, mouseY, 450, 670) <= 10)      mouseOver = "Transition 1";
          else if (dist(mouseX, mouseY, 500, 670) <= 10) mouseOver = "Transition 2";
          else if (dist(mouseX, mouseY, 550, 670) <= 10) mouseOver = "Transition 3";
          else if (dist(mouseX, mouseY, 600, 670) <= 10) mouseOver = "Transition 4";
          else if (dist(mouseX, mouseY, 650, 670) <= 10) mouseOver = "Transition 5";
        } else if (page == "nonMetals") {
          if (dist(mouseX, mouseY, 525, 670) <= 10)      mouseOver = "Nonmetal 1";
          else if (dist(mouseX, mouseY, 575, 670) <= 10) mouseOver = "Nonmetal 2";
        } else if (page == "rareEarths") {
          if (dist(mouseX, mouseY, 500, 670) <= 10)      mouseOver = "Rare Earth 1";
          else if (dist(mouseX, mouseY, 550, 670) <= 10) mouseOver = "Rare Earth 2";
          else if (dist(mouseX, mouseY, 600, 670) <= 10) mouseOver = "Rare Earth 3";
        }
      } else if (screens[CREDITS]) {
        // Determine if mouse is over a page switcher
        if (isMouseInside(30, 625, 80, 25))        mouseOver = "Credits 1";
        else if (isMouseInside(145, 625, 80, 25))  mouseOver = "Credits 2";
        else if (isMouseInside(255, 625, 120, 25)) mouseOver = "Credits 3";
        else if (isMouseInside(410, 655, 70, 25))  mouseOver = "Credits 4";
        else if (isMouseInside(505, 655, 110, 25)) mouseOver = "Credits 5";
        else if (isMouseInside(650, 625, 100, 25)) mouseOver = "Credits 6";
        else if (isMouseInside(775, 625, 140, 25)) mouseOver = "Credits 7";
        else if (isMouseInside(945, 625, 125, 25)) mouseOver = "Credits 8";

        // Otherwise check if it is over an element
        switch (creditsPage) {
          case 1: // Group 1
            if (isMouseInside(300, 170, 170, 35))      mouseOver = "Hydrogen Credits";
            else if (isMouseInside(345, 270, 125, 30)) mouseOver = "Lithium Credits";
            else if (isMouseInside(340, 370, 130, 30)) mouseOver = "Sodium Credits";
            else if (isMouseInside(290, 470, 180, 30)) mouseOver = "Potassium Credits";
            else if (isMouseInside(630, 220, 165, 30)) mouseOver = "Rubidium Credits";
            else if (isMouseInside(630, 315, 160, 35)) mouseOver = "Cesium Credits";
            else if (isMouseInside(630, 420, 160, 30)) mouseOver = "Francium Credits";
          break;

          case 2:  // Group 2
            if (isMouseInside(310, 180, 160, 30))      mouseOver = "Beryllium Credits";
            else if (isMouseInside(270, 320, 200, 40)) mouseOver = "Magnesium Credits";
            else if (isMouseInside(330, 460, 140, 30)) mouseOver = "Calcium Credits";
            else if (isMouseInside(630, 185, 170, 25)) mouseOver = "Strontium Credits";
            else if (isMouseInside(630, 320, 125, 40)) mouseOver = "Barium Credits";
            else if (isMouseInside(630, 460, 135, 30)) mouseOver = "Radium Credits";
          break;

          case 3:  // Group 3-12
            // Left Column
            if (isMouseInside(180, 100, 170, 30))      mouseOver = "Cadmium Credits";
            else if (isMouseInside(170, 150, 180, 30)) mouseOver = "Chromium Credits";
            else if (isMouseInside(240, 200, 110, 30)) mouseOver = "Cobalt Credits";
            else if (isMouseInside(220, 250, 130, 40)) mouseOver = "Copper Credits";
            else if (isMouseInside(270, 300, 80, 30))  mouseOver = "Gold Credits";
            else if (isMouseInside(200, 350, 150, 30)) mouseOver = "Hafnium Credits";
            else if (isMouseInside(235, 400, 115, 30)) mouseOver = "Iridium Credits";
            else if (isMouseInside(285, 450, 65, 30))  mouseOver = "Iron Credits";
            else if (isMouseInside(200, 500, 150, 30)) mouseOver = "Lutentium Credits";
            else if (isMouseInside(150, 550, 200, 40)) mouseOver = "Manganese Credits";
            // Center Column
            else if (isMouseInside(480, 100, 140, 40)) mouseOver = "Mercury Credits";
            else if (isMouseInside(440, 150, 220, 40)) mouseOver = "Molybdenum Credits";
            else if (isMouseInside(500, 200, 100, 30)) mouseOver = "Nickle Credits";
            else if (isMouseInside(480, 250, 140, 30)) mouseOver = "Niobium Credits";
            else if (isMouseInside(475, 300, 150, 30)) mouseOver = "Osmium Credits";
            else if (isMouseInside(465, 350, 170, 40)) mouseOver = "Palladium Credits";
            else if (isMouseInside(475, 400, 150, 30)) mouseOver = "Platinum Credits";
            else if (isMouseInside(470, 450, 160, 30)) mouseOver = "Rhenium Credits";
            else if (isMouseInside(470, 500, 160, 30)) mouseOver = "Rhodium Credits";
            else if (isMouseInside(455, 550, 190, 30)) mouseOver = "Ruthenium Credits";
            // Right Column
            else if (isMouseInside(750, 100, 175, 30)) mouseOver = "Scandium Credits";
            else if (isMouseInside(750, 150, 100, 30)) mouseOver = "Silver Credits";
            else if (isMouseInside(750, 200, 165, 30)) mouseOver = "Tantalum Credits";
            else if (isMouseInside(750, 250, 210, 30)) mouseOver = "Technetium Credits";
            else if (isMouseInside(750, 300, 150, 30)) mouseOver = "Titanium Credits";
            else if (isMouseInside(750, 350, 160, 40)) mouseOver = "Tungsten Credits";
            else if (isMouseInside(750, 400, 180, 30)) mouseOver = "Vandium Credits";
            else if (isMouseInside(750, 450, 125, 30)) mouseOver = "Yttrium Credits";
            else if (isMouseInside(750, 500, 75, 30))  mouseOver = "Zinc Credits";
            else if (isMouseInside(750, 550, 172, 30)) mouseOver = "Zirconium Credits";
          break;

          case 4:  // Metals
            if (isMouseInside(295, 170, 175, 30))      mouseOver = "Aluminum Credits";
            else if (isMouseInside(330, 270, 140, 30)) mouseOver = "Bismuth Credits";
            else if (isMouseInside(340, 370, 130, 30)) mouseOver = "Gallium Credits";
            else if (isMouseInside(355, 470, 115, 30)) mouseOver = "Indium Credits";
            else if (isMouseInside(630, 170, 80, 30))  mouseOver = "Lead Credits";
            else if (isMouseInside(630, 270, 150, 30)) mouseOver = "Thallium Credits";
            else if (isMouseInside(630, 370, 50, 30))  mouseOver = "Tin Credits";
            else if (isMouseInside(630, 470, 135, 30)) mouseOver = "Polonium Credits";
          break;

          case 5:  // Nonmetals
            // Left Column
            if (isMouseInside(160, 170, 170, 30))      mouseOver = "Antimony Credits";
            else if (isMouseInside(200, 270, 130, 30)) mouseOver = "Arsenic Credits";
            else if (isMouseInside(230, 370, 100, 30)) mouseOver = "Boron Credits";
            else if (isMouseInside(200, 470, 130, 30)) mouseOver = "Carbon Credits";
            // Center column
            else if (isMouseInside(450, 170, 200, 30)) mouseOver = "Germanium Credits";
            else if (isMouseInside(475, 270, 150, 30)) mouseOver = "Nitrogen Credits";
            else if (isMouseInside(485, 370, 130, 30)) mouseOver = "Oxygen Credits";
            else if (isMouseInside(445, 470, 210, 30)) mouseOver = "Phosphorus Credits";
            // Right Column
            else if (isMouseInside(770, 170, 165, 30)) mouseOver = "Selenium Credits";
            else if (isMouseInside(770, 270, 115, 30)) mouseOver = "Silicon Credits";
            else if (isMouseInside(770, 370, 105, 30)) mouseOver = "Sulfur Credits";
            else if (isMouseInside(770, 470, 160, 30)) mouseOver = "Tellurium Credits";
          break;

          case 6:  // Halogens
            if (isMouseInside(330, 180, 140, 30))      mouseOver = "Astatine Credits";
            else if (isMouseInside(325, 320, 145, 30)) mouseOver = "Bromine Credits";
            else if (isMouseInside(325, 455, 145, 35)) mouseOver = "Chlorine Credits";
            else if (isMouseInside(630, 250, 140, 30)) mouseOver = "Fluorine Credits";
            else if (isMouseInside(630, 385, 105, 30)) mouseOver = "Iodine Credits";
          break;

          case 7:  // Noble Gases
            if (isMouseInside(330, 180, 140, 40))      mouseOver = "Argon Credits";
            else if (isMouseInside(325, 320, 145, 30)) mouseOver = "Helium Credits";
            else if (isMouseInside(325, 455, 145, 45)) mouseOver = "Krypton Credits";
            else if (isMouseInside(630, 180, 140, 30)) mouseOver = "Neon Credits";
            else if (isMouseInside(630, 320, 105, 30)) mouseOver = "Radon Credits";
            else if (isMouseInside(630, 455, 105, 35)) mouseOver = "Xenon Credits";
          break;

          case 8:  // Rare Earths
            // Left Column
            if (isMouseInside(180, 130, 150, 30))      mouseOver = "Actinium Credits";
            else if (isMouseInside(205, 210, 125, 30)) mouseOver = "Cerium Credits";
            else if (isMouseInside(125, 290, 105, 40)) mouseOver = "Dysprosium Credits";
            else if (isMouseInside(210, 370, 120, 30)) mouseOver = "Erbium Credits";
            else if (isMouseInside(165, 450, 165, 40)) mouseOver = "Europium Credits";
            else if (isMouseInside(130, 530, 200, 30)) mouseOver = "Gadolinium Credits";
            // Center column
            else if (isMouseInside(475, 130, 150, 30)) mouseOver = "Holmium Credits";
            else if (isMouseInside(450, 210, 200, 30)) mouseOver = "Lanthanium Credits";
            else if (isMouseInside(445, 290, 210, 40)) mouseOver = "Neodymium Credits";
            else if (isMouseInside(420, 370, 260, 40)) mouseOver = "Praseodymium Credits";
            else if (isMouseInside(445, 450, 210, 30)) mouseOver = "Proactinium Credits";
            else if (isMouseInside(445, 530, 210, 30)) mouseOver = "Promethium Credits";
            // Right column
            else if (isMouseInside(770, 130, 180, 30)) mouseOver = "Samarium Credits";
            else if (isMouseInside(770, 210, 145, 30)) mouseOver = "Terbium Credits";
            else if (isMouseInside(770, 290, 145, 30)) mouseOver = "Thorium Credits";
            else if (isMouseInside(770, 370, 140, 30)) mouseOver = "Thulium Credits";
            else if (isMouseInside(770, 450, 150, 30)) mouseOver = "Uranium Credits";
            else if (isMouseInside(770, 530, 170, 30)) mouseOver = "Ytterbium Credits";
          break;
        }
      }
    }
  }
  return mouseOver;
}