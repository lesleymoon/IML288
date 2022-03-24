/* Ashwan Kadam
IML 277
3-24-22
HyperText
*/
//3-9-22,took code to load a gif and loaded in a specific gif I chose, https://github.com/extrapixel/gif-animation/tree/3.0
import gifAnimation.*; //import for static look
int speed=1; //variable that controls how fast you travle on screen; the more you mess up, the faster it gets
int iterator=0;//counter variable for number of times correct key is pressed and index for text 
int i=1;//variable to move text to left
int pos;
int glitchCount=0;//mess up counter
float posShift;//y shift variable
String book="It was the best of times, it was the worst of times, it was the age of wisdom, it was the age of foolishness, it was the epoch of belief, it was the epoch of incredulity, it was the season of Light, it was the season of Darkness, it was the spring of hope, it was the winter of despair, we had everything before us, we had nothing before us, we were all going direct to Heaven, we were all going direct the other way,—in short, the period was so far like the present period, ";
char[] array=book.toCharArray(); //Array of book text


Gif loopingGif;
//General algorithim: check for keyPressed, see if Key matches point in while loop, if so progress in loop and iterator. Every wrong letter is +1 gtichcount, varying ranges of which causing different types of glitches
void setup()
{
  size(1000, 1000);
  loopingGif = new Gif(this, "JZSC.gif");
  loopingGif.play();
  frameRate(30);
}
void draw()
{
  background(0);
  textSize(200);
  pos=500-i;
  fill(255);
  text(book, pos, 500+posShift);
  i=i+speed;
  textSize(200);
  if (glitchCount<=3) {
    fill(255, 0, 0);
  }
  if (glitchCount>3 && glitchCount<=7) {
    fill(random(255), random(255), random(255));
    posShift=random(-255,255);
     text(book, pos, 500+posShift);
  }
  if (glitchCount>7){
  fill(random(255), random(255), random(255));
    posShift=random(-500,500);
     image(loopingGif, 0,0);
  text(book, pos, 500+posShift);
  }
  if (iterator>=1) {
    text(book.substring(0, iterator), pos, 500+posShift);
  }
}
void keyReleased() {
    if (key==array[iterator]) { //If the right key was pressed, increase the iterator. Otherwise, increase the glitch count and the speed.
      iterator=iterator+1;
    } else {
      glitchCount++;
      speed=speed+2;
    }
    println(glitchCount);
  }
