PImage b;
PImage c; //copy; aka Copied image for reference
int [] clickable = new int [15];
String [] words = {"original", "gray", "orange", "pink", "blue", "save"};
String [] words2 = {"heart", "spaceship", "tumblr", "pixie", "meme"};
Sticker[] drawn = { };
boolean stickerMode = false;

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
    makeButton(x, 880, 150, 100);
    x += 150 + y;
  }
  fill(0);
  textSize(30);
  x = y = 54;
  for (int i = 0; i < 6; i++) {
    println(words[i]);
    makeText(y, i, 930);
  }
  fill(100);
  x = y = 82;
  for (int i = 0; i < 5; i++) {
    clickable[i] = x;
    makeButton(x, 1010, 175, 150);
    x += 150 + y;
  }
  fill(0);
  for (int i = 0; i < 5; i++) {
    println(words2[i]);
    makeText2(y, i, 1100);
  }

  /*
  // ================================ generates words
   fill(0);
   textSize(30);
   x = y = 54;
   for (int i = 0; i < 6; i++) {
   println(words[i]);
   makeText(y, i);
   }
   */
}

void makeButton(int xcoord, int ycoord, int l, int w) {
  rect (xcoord, ycoord, l, w, 10);
}

void makeText(int y, int i, int down) {
  text(words[i], (clickable[i] + y/2), down);
}

void makeText2(int y, int i, int down) {
  text(words2[i], (clickable[i] + y/2 - 15), down);
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
  if (stickerMode && 
    mouseX >= 0 && mouseX < b.width && 
    mouseY >= 0 && mouseY < b.height) {
    drawn = (Sticker[]) append(drawn, new Sticker(sticker, mouseX, mouseY));
  }
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
  imageMode(CENTER);
  for (Sticker s : drawn) {
    image(s.img, s.xcor, s.ycor);
  }
  /*
  if (mouseClicked) {
   if (stickerMode && 
   mouseX >= 0 && mouseX < b.width && 
   mouseY >= 0 && mouseY < b.height) {
   drawn = (Sticker[]) append(drawn, new Sticker(sticker, mouseX, mouseY));
   }
   }
   */
}

class Sticker {
  PImage img;
  int xcor;
  int ycor;

  Sticker(PImage i, int x, int y) {
    img = i;
    xcor = x;
    ycor = y;
  }
}
