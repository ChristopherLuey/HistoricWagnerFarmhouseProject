import processing.serial.*;

Serial myPort;
static String val;
int button1 = 0;
boolean washboard = false;
boolean home = true;
boolean stove = false;
boolean telephone = false;

void setup() {
  size(1400, 1000);
  noStroke();
  background(255);
  fill(0);

  textFont(createFont("Arial", 20));
   String portName = "/dev/cu.SLAB_USBtoUART";
   myPort = new Serial(this, portName, 9600);
   displayHomePage();
}

void draw() {
  if (myPort.available() > 0) {
    val = myPort.readStringUntil('\n');
    println(val);
    if (val != null) {
      if (val.contains("ON") || val.contains("OFF")) {
        if (!home) {
          displayHomePage(); 
        }
        washboard = false;
        home = true;
        stove = false;
        telephone = false;
        
        
        
      }
      if (val.contains("1")) {
        if (!washboard) {
          displayWashboardPage();
        }
        
        washboard = true;
        home = false;
        stove = false;
        telephone = false;
      }
      
      if (val.contains("3")) {
        if (!washboard) {
          displayStovePage();
        }
        stove = true;
        home = false;
        washboard = false;
        telephone = false;


      }
      
      if (val.contains("2")) {
        if (!telephone) {
          displayTelephonePage();
        }
        stove = false;
        home = false;
        washboard = false;
        telephone = true;


      }
    }    
  }
}

void displayHomePage() {
  background(255);
  PImage image = loadImage("farmhouse.jpg");
  imageMode(CENTER);
  image(image,width/2,height/2, width, height);
  
  textAlign(LEFT, LEFT);
  textSize(64);
  fill(0);
  textFont(createFont("Arial-BoldMT", 40));
  text("Welcome to the Historic Wagner Farm House", 50, 75);
  
  textAlign(LEFT, LEFT);
  textSize(30);
  fill(0);
  textFont(createFont("Arial", 30));
  text("Interact with the physical components to learn more", 50, 115);

  
}

void displayWashboardPage() {
  background(255);
  textAlign(CENTER, CENTER);
  fill(0);
  textFont(createFont("Arial-BoldMT", 40));
  text("1920s Laundry Washboard", width/2, 50);
  
  PImage washboardImage = loadImage("washboardtub.jpg");
  
  image(washboardImage, width/2, 300);

  textAlign(LEFT, TOP);
  textSize(24);
  fill(0);
  textFont(createFont("Arial", 24));
String info = "The washboard was a common household item used for hand-washing clothes before electric washing machines became widely available. It consisted of a flat wooden board with ridges or corrugations used to scrub clothes with soap and water, helping to remove dirt and stains. Although no longer commonly used, the washboard remains an important part of laundry history and a symbol of previous generations' ingenuity and hard work.";
  text(info, 50, height/2 + 135, width-100, height/2-50);
}

void displayStovePage() {
  background(255);
  textAlign(CENTER, CENTER);
  fill(0);
  textFont(createFont("Arial-BoldMT", 40));
  text("1920s Stove", width/2, 50);
  
  PImage stoveImage = loadImage("stove.jpg");
  
  image(stoveImage, width/2, 300, 600, 400);
  
  textAlign(LEFT, TOP);
  textSize(24);
  fill(0);
  textFont(createFont("Arial", 24));
String info = "In the 1920s, the kitchen stove was a vital piece of equipment for households. The most common type of stove was fueled by coal or wood, although gas and electric stoves were also available. Stoves typically consisted of a large oven and several burners on the top surface for cooking. The design of the stove varied greatly depending on the manufacturer, but most stoves were made of cast iron or steel and were often decorated with ornate designs. While cooking on a stove required a significant amount of time and attention, it was an essential part of daily life and contributed greatly to the overall comfort and well-being of a household.";
  text(info, 50, height/2 + 135, width-100, height/2-50);
}

void displayTelephonePage() {
   String info = "The 1920s telephone featured a metal body with a circular earpiece and a round dial numbered from 1 to 0. It had a long, thin cord that connected the earpiece to the body of the device, and a bell on the back that rang when an incoming call was received. Telephones were primarily used in business settings but became more widely available and affordable for personal use during this time.";
   background(255);
  textAlign(CENTER, CENTER);
  fill(0);
  textFont(createFont("Arial-BoldMT", 40));
  text("1920s Telephone", width/2, 50);
  
  PImage telephoneImage = loadImage("telephone.jpg");
  image(telephoneImage, width/2, 300, 400, 400);
  
  textAlign(LEFT, TOP);
  textSize(24);
  fill(0);
  textFont(createFont("Arial", 24));
  text(info, 50, height/2 + 135, width-100, height/2-50);
}
