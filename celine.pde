PImage b;
PImage c; //copy; aka Copied image for reference
int [] clickable = new int [15];
String [] words = {"original", "gray", "orange", "pink", "blue", "save"};

void setup() {
  size(1278, 1200);
  b = loadImage("dog.jpg");
  c = loadImage("dog.jpg");
  b.resize(1278, 850);
  c.resize(1278, 850);
  background(255);
  //println(b.width+" "+ b.height);
  // ================================= generates rectangles
  stroke(255);
  fill(127);
  int x;
  int y;
  x = y = 54;
  rectMode(CORNER);
  noStroke();
  for (int i = 0; i < 6; i++) {
    clickable[i] = x;
    makeButton(x);
    x += 150 + y;
  }
  // ================================ generates words
  fill(0);
  textSize(30);
  for (int i = 0; i < 6; i++) {
    println(words[i]);
    makeText(y, i);
  }
}

void makeButton(int xcoord) {
  rect (xcoord, 880, 150, 100, 10);
}

void makeText(int y, int i) {
  text(words[i], (clickable[i] + y/2), 930);
}

void mouseClicked() {
  // ============================================= ORIGINAL
  if (overButton(clickable[0], 880)) {
    for (int x = 0; x < c.width; x++) {
      for (int y = 0; y < c.height; y++) {
        float red = red(c.get(x, y)); 
        float grn = green(c.get(x, y)); 
        float blu = blue(c.get(x, y));
        b.set(x, y, color(red, grn, blu));
      }
    }
  }
  // ============================================= GRAY
  if (overButton(clickable[1], 880)) {
    for (int x = 0; x < c.width; x++) {
      for (int y = 0; y < c.height; y++) {
        float red = red(c.get(x, y)); 
        float grn = green(c.get(x, y)); 
        float blu = blue(c.get(x, y));
        b.set(x, y, color((red+grn+blu)/3));
      }
    }
  }
  // ============================================= ORANGE
  if (overButton(clickable[2], 880)) {
    for (int x = 0; x < c.width; x++) {
      for (int y = 0; y < c.height; y++) {
        float red = red(c.get(x, y)); 
        float grn = green(c.get(x, y)); 
        float blu = blue(c.get(x, y));
        int g = 5;
        b.set(x, y, color(red + 10 + y / g, grn + 50 - y / g, blu - 50 - y / g));
      }
    }
  }
  // ============================================= PINK
  if (overButton(clickable[3], 880)) {
    for (int x = 0; x < c.width; x++) {
      for (int y = 0; y < c.height; y++) {
        float red = red(c.get(x, y)); 
        float grn = green(c.get(x, y)); 
        float blu = blue(c.get(x, y));
        int g = 5;
        b.set(x, y, color(red + 40 + y / g, grn + 10 - y / g, blu + 20 + y / g));
      }
    }
  }
  // ============================================= BLUE
  if (overButton(clickable[4], 880)) {
    for (int x = 0; x < c.width; x++) {
      for (int y = 0; y < c.height; y++) {
        float red = red(c.get(x, y)); 
        float grn = green(c.get(x, y)); 
        float blu = blue(c.get(x, y));
        int g = 5;
        b.set(x, y, color(red - 100 + y / g, grn + 20 - y/ g, blu + 50 + y / g));
      }
    }
  }
  // ============================================= EXPORT/SAVE
  if (overButton(clickable[5], 880)) {
  }
  //leave random text generator for bottom row (aka sticker row?)
} //end

boolean overButton(int x, int y) {
  if (mouseX >= x && mouseX <= x+150 && 
    mouseY >= y && mouseY <= y+100) {
    return true;
  } else {
    return false;
  }
}
/*
void filter(float r, float g, float b) {
 for (int x = 0; x < c.width; x++) {
 for (int y = 0; y < c.height; y++) {
 float red = red(c.get(x, y)); 
 float grn = green(c.get(x, y)); 
 float blu = blue(c.get(x, y));
 b.set(x, y, color((r+g+b)/3));
 }
 }
 }
 */

void draw() {
  image(b, 0, 0);
  //while you hold the mouse down, it will affect the area near the mouse
  /*
  if (mousePressed) {
   processCircle(b, 30);
   }
   */
}

/*
void processCircle(PImage p, int r) {
 color black = color(0);
 for (int x = mouseX-r; x < mouseX+r; x++) {
 for (int y = mouseY-r; y < mouseY+r; y  ++) {
 if (dist(x, y, mouseX, mouseY)<=r) {
 //students can just set hte pixel to black for now!
 processPixel(p, x, y);
 }
 }
 }
 }
 
 void processRect(PImage p, int r) {
 color black = color(0);
 for (int x = mouseX-r; x < mouseX+r; x++) {
 for (int y = mouseY-r; y < mouseY+r; y  ++) {
 //students can just set hte pixel to black for now!
 processPixel(p, x, y);
 }
 }
 }
 
 //since we are doing this on mousedown this should 
 //yield the same result when run on the same pixel 
 //multiple times
 void processPixel( PImage p, int x, int y) {
 
 
 //get the 3 colors
 float red = red(p.get(x, y)); 
 float grn = green(p.get(x, y)); 
 float blu = blue(p.get(x, y));
 //set a new color somehow 
 //gray:
 //p.set(x, y, color((red+grn+blu)/3));
 //remove all blue
 p.set(x, y, color(red, 255, 0));
 */

//END OF CODE!!!


//STICKER STUFF


//class (just put at bottom of file)
class Sticker {
  PImage img;
  int xcor;
  int ycor;
  
  Sticker(PImage i, int x, int y){
    img = i;
    xcor = x;
    ycor = y;
  }
  
}

/*
//global variable put at top
Sticker[] drawn = { };

//put this in the draw() after image(b, 0, 0)
  imageMode(CENTER);
  for (Sticker s : drawn){
    image(s.img, s.xcor, s.ycor);
  }
  
  //put this in draw at the end of it
  
    if (mouseClicked){
   drawn = (Sticker[]) append(drawn, new Sticker(sticker, mouseX, mouseY));
  }
*/
