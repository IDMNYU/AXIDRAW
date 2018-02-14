# AXIDRAW
repository for all things IDM and AxiDraw

the [AxiDraw](http://axidraw.com) is a simple, USB-driven drawing machine.

first thing to do is, get the [user guide](https://wiki.evilmadscientist.com/AxiDraw_User_Guide).

second thing to do is, [install the software](https://wiki.evilmadscientist.com/Axidraw_Software_Installation).

you can use the AxiDraw with a few programs:
* easiest is InkScape (installs with the software).
* there are also [Python](https://github.com/fogleman/axi), [Node](https://www.npmjs.com/package/cncserver), and [Processing](https://github.com/evil-mad/AxiDraw-Processing/tree/master/AxiGen1) libraries.

if you're using Inkscape, the most important stuff is :
* if you're using a PDF, make sure there isn't a border box (the AxiDraw will try to sketch it). open your file in Illustrator first and see if there's anything like a big white square covering the entire artboard. if there is, delete it and resave the PDF.
* under the *File->Document Properties...*, you will need to set the paper size and orientation. even if you output a PDF you think is the right size.
* under the *Extensions->AxiDraw->AxiDraw Control...*, you will find everything you need. the first tab sends the current file to the plotter. the second tab lets you calibrate the penup/pendown states on the plotter and resets the system.
* **IMPORTANT**: if you need to move the AxiDraw into the 'home' position or quit a plot for any reason, use the *AxiDraw Control* panel to disengage off the motors first by applying the *Raise pen, turn off motors* option. the *Toggle pen between UP, DOWN* is used to attach a new pen. take look in the manual for how it works.
