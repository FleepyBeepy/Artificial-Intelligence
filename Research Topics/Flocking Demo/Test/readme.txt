Hello and welcome to the Flocking Demo!  

Contents
	About the Flocking Demo
	Installation Instructions
	Uninstall Instructions
	About the Source Code
	Contacting RiverSoftAVG


-------------------------------------------------------------------------
About the Flocking Demo
-------------------------------------------------------------------------

The Flocking demo allows you to play with the four rules of flocking: 
separation, alignment, cohesion, and avoidance.  Separation means that each
member, or boid, of a flock tries to keep a minimum distance from every other
boid in the flock.  Alignment means that each boid tries to go in the same
direction as the rest of the flock.  Cohesion means that each boid tries
to get as close as possible to the rest of the flock (huddle together). 
Finally, Avoidance means each boid tries to not get too close, or avoid,
boids in other flocks.  From these four simple rules of flocking emerges
apparently life-like behavior for a flock.

The flocks in the demo represent schools of fishes (actually, they are arrows
but it looks so much like schools of fishes that that is what I am calling
them :) ).  Each flock is drawn in a different color.

The demo allows you to:

·	View a 2D simulation of one flock or multiple flocks
·	Run or step through a simulation
·	Set the number of flocks (1-10)
·	Set the number of boids (members) of each flock (2-100)
·	Toggle on/off any flocking rule
·	Set the relative strength of the rule on each member of the flock

      This software is freeware.  You are authorized to duplicate and modify
      this software.  No guarantees or warranties.  

This demo borrows concepts and algorithms from Steven Woodcock's
article, "Flocking: A Simple Technique for Simulating Group Behavior,"
which is found in the book, Game Programming Gems (a great book by the way).


-------------------------------------------------------------------------
Installation Instructions
-------------------------------------------------------------------------

1.	Unzip the file to its own directory.

2.	To install the components:
	a.	Start Delphi
	b.	Close all files.  Select File->Open...
	c.	Find the Flocking.dpk file
	d.	Click Compile and then Install
3.	To look at the source, open the FlockDemo.dpr file


Enjoy!

If there are any problems, don't hesitate to contact me at support@RiverSoftAVG.com


-------------------------------------------------------------------------
Uninstall Instructions
-------------------------------------------------------------------------

1.	To uninstall the components:
	a. Open Delphi
	b. Select Component->Install Packages...
	c. Find the "RiverSoftAVG Flocking Components" package
	d. Select it and click Remove
2.	Delete the files.


-------------------------------------------------------------------------
About the Source Code
-------------------------------------------------------------------------

There are three .pas files in the project.

·	Vector.pas provides a simple vector class for such things as 
	orientation, velocity, and position
·	FlockMain.pas is the main application for the demo
·	Flock.pas is the flocking code and is the meat of the demo.

There are three main classes to the flocking code: TFlockWorld, TFlock,
and TBoid.

The TFlockWorld class represents the world within which the flocks live.  
As such, it tracks every flock in the world as well as define the characteristics
of the world (mostly boundaries).

The TFlock class represents the flock and is made up of a collection of
TBoid objects.  The TFlock class is responsible for tracking every member
in the flock as well as defining the behaviors the flock members should
execute.  It also tracks the averaged center position and velocity of all
the flock members (used with alignment and cohesion).  The flock is also
responsible for freeing the boids in its flock.

The TBoid class represents a single entity in the flock and is the guts
of the flocking code.  Each boid has a position, velocity, and speed.
Every step of the simulation, the TFlock class calls the Update method of 
the boid.  In this method, the boid moves based on the flocking rules.

I recommend reading Steve Woodcock's article in Game Programming Gems to
properly understand the source code.  It should be noted that the flocking 
behavior in this demo differs from Steve Woodcock's in a couple ways
(besides being modified for Delphi constructs and my style of coding).
Steve's boids track an arbitrary number of "friends" and "enemies".  His
alignment, cohesion, and avoidance rules use this localized knowledge to
manipulate the direction and speed of the boid.  In the alignment rule for
this demo, each boid tries to align with the averaged velocity
vector of the entire flock (instead of a localized group).  Even though
Steve's demo is more "realistic," this code doesn't do this to simplify 
the classes and code for demo purposes.  Similarly, in the cohesion rule,
this demo looks at the averaged center point for the entire flock.

 
-------------------------------------------------------------------------
Contacting RiverSoftAVG
-------------------------------------------------------------------------

For technical support send email to:

  support@RiverSoftAVG.com

-------------------------------------------------------------------------

 Unless otherwise noted, all materials provided in this release
 are Copyright © 2001, Thomas G. Grubb.

-------------------------------------------------------------------------
