/*
 *  Declaration and initialization of runtime variables. All global variables
 *  and PImage objects used in this program are declared here. The
 *  initVariables() and initImages() functions are called during setup().
 *  Loading lots of images can take a while, so its done in a separate thread.
 */
final float FPS = 60;               // Set desired frame rate
final float loadTime = 3*FPS;       // Loading time in frames
Boolean isFinishedLoading = false;  // True when initial animation is finished
Boolean varsLoaded = false;         // True when variables are initialized
Boolean imagesLoaded = false;       // True when images are done loading
Boolean inProgress = false;         // True while transitions happen
char transitionFlag;                // Selector for transition type
String mouseOver = null;            // Store the location of the mouse
PFont Georgia, Belgium, Arial;      // Declare fonts

String page;
int transitionMetalPage = 1;
int nonmetalPage = 1;
int rareEarthPage = 1;
int creditsPage = 1;

float deltaX = 0;   // Horizontal Translation
float deltaY = 0;   // Vertical Translation
float alpha = 0;    // Transparency
float theta = 0;    // Rotation
float zeta = .02;   // Zoom
byte dir = 0;       // Direction of transition
Box imageCube;      // Constructor for 3D imageCube

final int HOME = 0;          // Main screen
final int PICTURES = 1;      // Element line up
final int INFO = 2;          // Element descriptions
final int CREDITS = 3;       // General credits
final int SUBCREDITS = 4;    // Individual credits
Boolean[] screens = new Boolean[5];   // Indexes relate to names of screens

XML dataSource;                  // xml object to store data
XML[] elements, names, sources;  // xml arrays to store child elements

Boolean homePressed = false;  // Which button was clicked?
Boolean backPressed = false;
Boolean infoPressed = false;

Boolean verbose = false;      // Toggles debugging output
Boolean altPressed = false;   // Stores state of alt key

PImage loadScreen, homeScreen;  // Splash screen and main page
PImage currentPage, nextPage;   // The current picture and the one to show next
PImage homeButton, backButton;  // Navigation buttons
PImage[] groupPics = new PImage[15];
PImage[] elementPics = new PImage[93];  // Index corresponds to atomic number
PImage[] creditPics = new PImage[8];    // Index corresponds to page number

/*=============================================================================
=============================================================================*/

void initVariables() {
  Georgia = loadFont("Fonts/Georgia-40.vlw");  // Load fonts from .vlw files
  Belgium = loadFont("Fonts/Belgium-40.vlw");
  Arial = loadFont("Fonts/ArialMT-32.vlw");
  textFont(Arial); fill(0); noStroke();        // Set initial font type, fill color and stroke style

  // Set boolean values for screens false
  for (int i = 0; i < screens.length; i++) screens[i] = false;

  // Set window title and application icon
  frame.setTitle("The Elements: An Exploration into the World of Chemistry");
  PImage icon = loadImage("icon.png");
  frame.setIconImage((Image) icon.getNative());

  println("Variables Initialized");
  varsLoaded = true;
}

void parseSubCredits() {
  // Load xml data into XML object
  dataSource = loadXML("dataSource.xml");
  // Create another XML object fot the elements
  elements = dataSource.getChildren("element");
  // And yet another for the list of sources
  sources = dataSource.getChildren("element/sources");
}

void initImages() {
  cursor(WAIT);
  homeButton = loadImage("Navigation/Home Button.png");
  backButton = loadImage("Navigation/Back Button.png");

  // Create xml array and load it with "group path" elements
  XML[] groupPaths = dataSource.getChildren("group/path");
  // For each index in groupPics...
  for (int i = 0; i < groupPics.length; i++) {
    String path = groupPaths[i].getContent();    // Get the path for the image
    groupPics[i] = loadImage(path);              // and load it into the array
  }

  // Create xml array and load it with "element path" elements
  XML[] imagePaths = dataSource.getChildren("element/path");
  // For each index in elementPics...
  for (int i = 0; i < elementPics.length; i++) {              
    String path = imagePaths[i].getContent();    // Get the path for the image
    elementPics[i] = loadImage(path);            // and load it into the array
  }

  // Create xml array and load it with "credit path" elements
  XML[] creditPaths = dataSource.getChildren("credit/path");
  // For each index in creditPics...
  for (int i = 0; i < creditPics.length; i++) {
    String path = creditPaths[i].getContent();   // Get the path for the image
    creditPics[i] = loadImage(path);             // and load it into the array
  }

  println("Images Intialized");
  cursor(ARROW);
  imagesLoaded = true;
}