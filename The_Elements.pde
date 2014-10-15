/*
 *  The Elements: An Exploration into the World of Chemistry
 *  Developed by Eric Roch
 *    This program is designed to be a source of trivia and basic facts about
 *    the elements. It is not a chemical reference source, nor a place to
 *    look for technical information.
 */
import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;
import java.awt.Image;

void setup() {
  size(1100, 700, P3D);    // Set the window size and enable the 3D renderer
  background(155);         // Set the background to grey
  frameRate(FPS);          // Set optimal frame rate (60 fps recommended)
  noCursor();              // Disable the cursor

  parseSubCredits();        // Load xml arrays with data from "dataSource.xml"
  thread("initVariables");  // Initialize transition variables
  thread("initImages");     // Initialize images

  // Load images into PImage objects
  loadScreen = loadImage("Navigation/Splash Screen.png");
  homeScreen = loadImage("Navigation/Main Screen.png");

  // Initialize imageCube for transition and set drawing mode for images
  imageCube = new Box(this, width, height, width);
  imageCube.drawMode(Shape3D.TEXTURE);

  imageMode(CENTER);                      // Place images about to their center
  image(loadScreen, width/2, height/2);   // Display the Splash Screen
  nextPage = homeScreen;                  // Inistialize nextPage
}

void draw() {
  // After the splash screen, update cursor and run animation functions
  if (isFinishedLoading) {
    // Force cursor to arrow while transitions happen
    // If not transitioning, and mouse is over something, show hand
    if (inProgress || mouseOver == null) cursor(ARROW);
    else if (mouseOver != null) cursor(HAND);

    // Null pointer exceptions will happen if you animate too early,
    // so only call animateScreens() after images are loaded
    if (imagesLoaded) animateScreens();
    else cursor(WAIT);
  }
  // If the opening animation hasn't finished, keep running it
  else if (frameCount > loadTime) {
    noCursor();
    spin();
    if (!inProgress) {
      setScreens(HOME);
      cursor();
      isFinishedLoading = true;
    }
  }
  debug(verbose);  // If true, will print a variety of debugging information
  delay(5);        // Give processor time to breath, 3D graphics take some work
}

/*
 *  Manipulates animation variables depending on type of transition.
 *  The transition is selected by assigning a char to a variable named
 *  transitionFlag. A function is then called to execute the animation.
 *
 *  Each function will incriment its respective variables each time it
 *  is called and the images are displayed in their new position when
 *  the draw() function ends. When the animation is finished (i.e. the
 *  variables are at their final value), all variables are reset and
 *  the flag that indicates a transition is taking place is reset.
 */
void animateScreens() {
  if (transitionFlag == 'B') cube3D("next");
  else if (transitionFlag == 'b') cube3D("last");
  else if (transitionFlag == 'U') cover("next");
  else if (transitionFlag == 'u') cover("last");
  else if (transitionFlag == 'V') push('y', "next");
  else if (transitionFlag == 'v') push('y', "last");
  else if (transitionFlag == 'H') push('x', "next");
  else if (transitionFlag == 'h') push('x', "last");
  else if (transitionFlag == 'F') fade();
  else if (transitionFlag == 'S') spin();
  else if (transitionFlag == 'C') {
    image(nextPage, width/2, height/2);      // Show the next picture
    currentPage = nextPage; nextPage = null; // Update page definitions
  }
  if (!inProgress) {
    transitionFlag = '\n';                // Placeholder, dummy valie
    deltaX = deltaY = alpha = theta = 0;  // Reset variables to zero
    zeta = 0.2;                           // Except for zeta which starts at 0.2
  }
}

void cube3D(String direction) {
  inProgress = true;                        // Toggle progress indicator on
  if (direction == "next") dir = 1;         // Set local value to +1
  else if (direction == "last") dir = -1;   // Set local value to -1 (scalar)
  background(50);                           // Erase canvas
  pushMatrix();//--------------------------------------------------------------
    // Translate away from screen by some value based on rotation.
    // Keeps corners on edge of screen.
    if (theta < PI/4) translate(width/2, height/2, -(width/2 * sqrt(2) * cos(PI/4 - abs(theta))));
    else              translate(width/2, height/2, -(width/2 * sqrt(2) * cos(abs(theta) - PI/4)));
    
    rotateY(theta);                                 // Rotate about the y-axis
    imageCube.x(0); imageCube.y(0); imageCube.z(0); // Set origin to (0,0,0)
    imageCube.setTexture(currentPage, 1);           // Front image
    imageCube.setTexture(nextPage, 4 | 8);          // Left and Right images
    imageCube.draw();                               // Render imageCube
  popMatrix();//---------------------------------------------------------------
  if (abs(theta) < HALF_PI) {       // If theta is less/greater than (+/-)PI/2:
    theta -= dir*PI/150;            // In/decrease theta to about (+/-)PI/2
    // If close to (+/-)PI/2, set theta to exactly (+/-)PI/2
    if (abs(dir*HALF_PI + theta) < .001) theta = HALF_PI;
  } else {
    currentPage = nextPage; nextPage = null;  // Update page definitions
    inProgress = false;                       // Toggle progress indicator off
  }
}

void cover(String direction) {
  inProgress = true;                        // Toggle progress indicator on
  if (direction == "next") dir = 1;         // Set local value to 1
  else if (direction == "last") dir = 0;    // Set local value to 0 (boolean)
  background(50);                           // Erase canvas
  pushMatrix();//--------------------------------------------------------------
  /*  Move the canvas down by height and rotate along the top edge (bottom
      of the screen). If going forward, show the new picture with the old
      one slightly in front as it slides out, and vice-versa for going back */
    translate(0, height+100, 0);
    rotateX(theta);
    if (dir == 1) {
      image(nextPage, width/2, -height/2-100);
      translate(deltaX, 0, 1);
      image(currentPage, width/2, -height/2-100);
    } else {
      image(currentPage, width/2, -height/2-100);
      translate(deltaX - 1.3*width, 0, 1);
      image(nextPage, width/2, -height/2-100);
    }
    fill(50,100); rect(width, -height-85, 15, height);  // Draw shadow
  popMatrix();//---------------------------------------------------------------
  /*  If the horizontal has not been moved, tilt the canvas until it reaches
      PI/8 radians. When done tilting, move in the proper direction. When
      done sliding, tilt the canvas back upright, then redraw the image
      to get rid of the z-axis translation */
  if (theta < PI/8 && deltaX == 0) theta += PI/180;
  else {
    if (abs(deltaX) < 1.3*width) {
      if (dir == 1) deltaX -= width/40;
      else deltaX += width/40;
    } else {
      if (theta > 0) theta -= PI/180;
      else {
        background(155);
        image(nextPage, width/2, height/2);
        currentPage = nextPage; nextPage = null;
        inProgress = false;
      }
    }
  }
}

void push(char axis, String direction) {
  inProgress = true;                          // Toggle progress indicator on
  if (direction == "next") dir = 1;           // Set local value to +1
  else if (direction == "last") dir = -1;     // Set local value to -1 (scalar)
  pushMatrix();//--------------------------------------------------------------
  /*  Move the canvas left/right or up/down. Movement will depend on value of
      axis. Show the current picture in the center of the canvas. Show the next
      on both axis and shift the canvas to reveal the next page. */ 
    translate(deltaX, deltaY, 0);
    image(currentPage, width/2, height/2);
    if (dir == 1) {
      image(nextPage, 1.5*width, height/2);
      image(nextPage, width/2, 1.5*height);
    } else {
      image(nextPage, -width/2, height/2);
      image(nextPage, width/2, -height/2);
    }
  popMatrix();//---------------------------------------------------------------
  /*  Move the appropriate axis. Once the transition is complete, redraw the
      next page without translations */
  if (axis == 'x') {
    if (abs(deltaX) < width) deltaX -= dir*width/50;
  } else if (axis == 'y') {
    if (abs(deltaY) < height) deltaY -= dir*height/50;
  }
  if (abs(deltaX) >= width || abs(deltaY) >= height) {
    image(nextPage, width/2, height/2);
    currentPage = nextPage; nextPage = null;
    inProgress = false;
  }
}

void fade() {
  inProgress = true;                      // Toggle progress indicator on
  delay(30);                              // Delay to slow down fade time
  tint(255, alpha);                       // Apply an alpha tint on the image
  image(nextPage, width/2, height/2);     // Show the next picture
  if (alpha < 100) alpha += 5;
  else {
    noTint(); image(nextPage, width/2, height/2);  // Show the next picture
    currentPage = nextPage; nextPage = null;       // without any tint
    inProgress = false;
  }
}

void spin() {
  inProgress = true;                    // Toggle progress indicator on
  background(50);                       // Erase canvas
  pushMatrix();//--------------------------------------------------------------
  /*  Make the origin of the canvas the center of the screen and rotate about
      the origin. */
    translate(width/2, height/2, 0);
    rotateZ(theta);
    scale(zeta);
    image(nextPage, 0, 0);
  popMatrix();//---------------------------------------------------------------
  /*  If done, reset flags. Otherwise increase spin and zoom variables. */
  if (zeta == 1 && theta == TWO_PI) {
    currentPage = nextPage; nextPage = null;
    inProgress = false;
  } else {
    zeta = (zeta < 1) ? zeta + .02 : 1;
    theta = (theta < TWO_PI) ? theta + PI/25 : TWO_PI;
  }
}