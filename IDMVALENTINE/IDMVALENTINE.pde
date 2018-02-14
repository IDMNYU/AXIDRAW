// I<3DM
// a valentine pdf printer
// rld, 2.12.18
//
// because love is a vector, not a raster.
//
// if you're printing to a PDF, uncomment the two lines that say
// PRINT TO PDF. if you're viewing on screen, uncomment the two
// lines that say VIEW ON SCREEN. don't uncomment both options.
//

import processing.pdf.*; // external PDF library

// variables:
PFont thetype;
int vptr = 0;
float i, px, py; // angle in radians, previous coords
float s = 300; // size
boolean first = true;
int currep = 1;

//
// user-defined variables are in the 'presets' tab.
//

// begin here:
void setup() {
  // 72 dpi system, so 792x612 = 8.5"x11":
  size(792, 612, PDF, vname+".pdf"); // PRINT TO PDF
  //size(792, 612); // VIEW ON SCREEN
  
  background(255); // clear
  frameRate(24); // fps
  thetype = createFont("Didot", fsize); // load ttf...
  textFont(thetype, fsize); // ...use it
}

// every frame:
void draw() {
  // HEART FUNCTION:
  float x = 16.*sin(i)*sin(i)*sin(i);
  float y = 13.*cos(i)-5.*cos(2.*i)-2*cos(3.*i)-cos(4.*i);
  x=x/20.;
  y=(y/20.)*-1.;
  x=x*s+width/2;
  y=y*s+height/2;
  
  // offset for text
  float ox = sin(i)*toff;
  float oy = -cos(i)*toff;

  noFill();
  stroke(0);

  // 1 - cline: lines from center
  if (cline) line(x, y, width/2, height/2); // center line

  // 2 - edge: outline the heart
  if (edge) {
    if (first) first = false; 
    else line(x, y, px, py); // outer edge
  }

  // 3 - circle: circles at the edge
  if (circle) ellipse(x, y, d, d); // circle

  // 4 - diamond: diamonds at the edge
  if (diamond) {
    translate(x, y);
    rotate(i);
    rect(-d/2, -d/2, d, d); // square
    resetMatrix();
  }

  // 5 - draw text
  fill(0);
  text(vname.charAt(vptr), x+ox, y+oy); // name

  // looping function:
  if ((c>0&&(i+c)>TWO_PI)||(c<0&&(i+c)<0))
  {
    if (currep<numreps) currep++; else exit(); // PRINT TO PDF
    //if (currep<numreps) currep++; else noLoop(); // VIEW ON SCREEN
  }

  // increment variables:
  i = (i+c+TWO_PI)%TWO_PI;
  vptr = (vptr+1) % vname.length();
  px = x;
  py = y;
}