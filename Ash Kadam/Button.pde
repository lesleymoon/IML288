/*
Ashwan Kadam
 Button
 2/16/22
 */

import processing.sound.*; //Accessing a library to play sound

PImage SG; //initializing up an image variable
boolean ifClicked=false; //variable to see if mouse was clicked
int i=0; //counter variable for image position


SoundFile music; //SoundFile variable initialization


void setup () {
  size (600, 600); //Creating canvas

  //Loading in the image of the 8-bit sunglasses
  SG=loadImage("sunglasses.png");
}

void draw () {
  //Creating varing RGB background colors to play when the mouse is clicked
  float R = random(255);
  float G = random(255);
  float B = random(255);

  clear();//resets background on every loop so animal "follows" you
  background(0, 100, 0); //forest background (default background when mouse is unclicked/when user has clicked the mouse 2*n times)

  //The following if-else structure creates a rectangle the size of the canvas window with a randomly generated fill color if the mouse is clicked 1+2*n times, where n is number of mouse clicks. If the mouse is unclicked, nothing happens to the background and it remains forest green. After the mouse is clicked once, the else statement runs continuosly, ggenerating a new background color for a strobe effect until the mouse is clicked again (A.K.A when the ifClicked variable becomes false)
  //https://www.willprice.dev/learning%20processing/2011/05/01/learning-processing-chapter-56.html, Date Accessed: 2/17/22, What I Changed: I kept the concept of using a boolean to create a latch mechanism that would be updated through mousePressed(), which would in turn cause an effect through an if-else structure in void draw(). What I changed was what the latch does - in my code, when the boolean updates to true, music plays, the background changes, and an image animates on screen. 
  if (ifClicked==false) {
  } 
  else {
    fill(R, G, B);
    rect(0, 0, 600, 600);
  }

  //body
  fill(130, 69, 53);
  stroke(0, 0, 0);
  ellipse (mouseX, mouseY, 200, 250);

  //stomache
  fill(193, 154, 107);
  stroke(0, 0, 0);
  ellipse(mouseX, mouseY, 100, 150);

  //head
  fill(130, 69, 53);
  stroke(0, 0, 0);
  ellipse (mouseX, mouseY-(250+125)/2, 150, 175);

  //eyes
  fill(0, 0, 0);
  stroke(0, 0, 0);
  ellipse (mouseX-30, mouseY-(250+150)/2, 30, 40);//left eye
  ellipse (mouseX+30, mouseY-(250+150)/2, 30, 40);//right eye

  //eyeballs
  fill(255, 255, 255);
  stroke(0, 0, 0);
  ellipse (mouseX-32, mouseY-(250+150)/2-4, 15, 20);//left eyeball
  ellipse (mouseX+28, mouseY-(250+150)/2-4, 15, 20);//right eyeball

  //mouth
  noFill();
  arc(mouseX, mouseY-(250+150)/2+50, 60, 40, 0, PI);

  //nose
  fill(193, 154, 107);
  stroke(0, 0, 0);
  arc(mouseX, mouseY-(250+150)/2+25, 25, 25, 0, PI, CHORD);

  //ears
  fill(130, 69, 53);
  noStroke();
  ellipse(mouseX-50, mouseY-(250+150)/2-50, 50, 50); //Left Ear
  ellipse(mouseX+50, mouseY-(250+150)/2-50, 50, 50); //Right Ear

  //inner ears
  fill(193, 154, 107);
  stroke(0, 0, 0);
  arc(mouseX-50, mouseY-(250+150)/2-50, 40, 40, radians(125.0), radians(320), CHORD); //left inner ear
  arc(mouseX+50, mouseY-(250+150)/2-50, 40, 40, radians(320-102), radians(360+(125-72)), CHORD); //right inner ear

  //hands
  fill(130, 69, 53);
  stroke(0, 0, 0);
  ellipse(mouseX-110, mouseY-50, 80, 70);//left hand
  ellipse(mouseX+110, mouseY-50, 80, 70);//right hand

  //legs
  ellipse(mouseX-60, mouseY+110, 90, 60);//left leg
  ellipse(mouseX+60, mouseY+110, 90, 60);//right leg

  //hand paws
  fill(193, 154, 107);
  stroke(0, 0, 0);
  ellipse(mouseX-110, mouseY-50, 40, 35);//left paw hand
  ellipse(mouseX+110, mouseY-50, 40, 35);//right paw hand

  //foot paws
  ellipse(mouseX-60, mouseY+110, 45, 35);//left paw foot
  ellipse(mouseX+60, mouseY+110, 45, 35);//right paw foot

  //mouse-latch structure
  //https://www.willprice.dev/learning%20processing/2011/05/01/learning-processing-chapter-56.html, Date Accessed: 2/17/22, What I Changed: I kept the concept of using a boolean to create a latch mechanism that would be updated through mousePressed(), which would in turn cause an effect through an if-else structure in void draw(). What I changed was what the latch does - in my code, when the boolean updates to true, music plays, the background changes, and an image animates on screen. 
  if (ifClicked==false) { //if the mouse is unclicked, do nothing; just progress past this structure
  } 
  else { //if the mouse is clicked, generate the image of the 8-bit sunglasses and have them slide down the screen onto the bear's eyes.
    imageMode(CENTER);
    if (i<mouseY-((250+150)/2)+10) { //If the location for the bear's eyes has not been met, slide the glasses down to a specified value,, i, which is dependent on the mouse position. When this coordinate is reached, stay at that value
      image(SG, mouseX+5, i, 200, 200);
      i=i+1;
    } else {
      i=mouseY-((250+150)/2)+10;
      image(SG, mouseX+5, i, 200, 200);
    }
  }
}

//This function runs when the mouse is pressed. When the mouse is presssed, the boolean ifClicked becomes true if it was previously false and vice versa. creating a "latch" effect
//https://www.willprice.dev/learning%20processing/2011/05/01/learning-processing-chapter-56.html, Date Accessed: 2/17/22, What I Changed: I kept the concept of using a boolean to create a latch mechanism that would be updated through mousePressed(), which would in turn cause an effect through an if-else structure in void draw(). What I changed was what the latch does - in my code, when the boolean updates to true, music plays, the background changes, and an image animates on screen. 
void mousePressed() {
  if (ifClicked==false) {
    ifClicked=true;
    i=0;//resetting i to 0 makes it so every time the user clicks on the mouse 2*n times, the sunglasses restart at the top of the screen
    music=new SoundFile(this, "music.mp3"); //this stores the .mp3 file into a variable
    music.play(); //this plays the music when the mouse is clicked every 2*n times
  } 
  else {
    ifClicked=false;
    music.pause(); //This stops the music when the mouse is clicked every 1+2*n times
  }
}
