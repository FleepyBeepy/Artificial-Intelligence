HelpScribble project file.
10
aubznf T. Tehoo-0N2953
0
1



Copyright 2001, Thomas G. Grubb
TRUE

E:\Comps\AI\Flocking\Test
1
BrowseButtons()
0
FALSE

FALSE
14
10
Scribble10
Flocking Demo




Done



FALSE
24
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}{\f2\fnil\fcharset2 Symbol;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 Flocking Demo\cf0\b0\f1\fs20 
\par 
\par \cf2\fs16\{bmc FlockDemo.shg\}\cf0 
\par \fs20 
\par The Flocking demo allows you to play with the four rules of flocking: separation, alignment, cohesion, and avoidance.  Separation means that each\f0  \f1 member, or boid, of a flock tries to keep a minimum distance from every other\f0  \f1 boid in the flock.  Alignment means that each boid tries to go in the same\f0  \f1 direction as the rest of the flock.  Cohesion means that each boid tries\f0  \f1 to get as close as possible to the rest of the flock (huddle together). \f0  \f1 Finally, Avoidance means each boid tries to not get too close, or avoid,\f0  \f1 boids in other flocks.  From these four simple rules of flocking emerges\f0  \f1 apparently life-like behavior for a flock.
\par 
\par The flocks in the demo represent schools of fishes (actually, they are arrows\f0  \f1 but it looks so much like schools of fishes that that is what I am calling\f0  \f1 them :) ).  Each flock is drawn in a different color.
\par 
\par The demo allows you to:
\par 
\par \pard{\pntext\f2\'B7\tab}{\*\pn\pnlvlblt\pnf2\pnindent0{\pntxtb\'B7}}\fi-200\li200\f0 View a 2D simulation of one flock or multiple flocks
\par {\pntext\f2\'B7\tab}Run or step through a simulation
\par {\pntext\f2\'B7\tab}Set the number of flocks (1-10)
\par {\pntext\f2\'B7\tab}Set the number of boids (members) of each flock (2-100)
\par {\pntext\f2\'B7\tab}Toggle on/off any flocking rule
\par {\pntext\f2\'B7\tab}Set the relative strength of the rule on each member of the flock
\par {\pntext\f2\'B7\tab}\pard 
\par       This software is freeware.  You are authorized to duplicate and modify this software.  No guarantees or warranties.  
\par 
\par This demo borrows concepts and algorithms from Steven Woodcock's article, "Flocking: A Simple Technique for Simulating Group Behavior," which is found in the book, Game Programming Gems (a great book by the way).
\par \f1 
\par }
12
Scribble12
Simulation View
View



Done



FALSE
7
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Simulation View
\par \cf0\b0\fs20 
\par \f1 The simulation view displays the flocks in a 2D window.  Every member, or boid, of a flock is represented by a an arrow within the view.  All boids of the same flock are the same color.  If the \cf2\strike Follow Mouse\cf3\strike0\{linkID=130\}\cf0  checkbox is checked, then the FIRST flock will follow your mouse cursor whereever it is over this view.\f0 
\par \cf2\strike\fs16 
\par }
20
Scribble20
One Step Button
One Step



Done



FALSE
7
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 One Step Button
\par \cf0\b0\fs20 
\par \f1 This button executes the flocking simulation for one step.  Every member, or boid, of a flock examines its surroundings and moves itself based on flocking rules currently active: separation, alignment, cohesion, and avoidance.  The \cf2\strike Behaviors \cf3\strike0\{linkID=50\}\cf0 checklist controls which flocking rules are active.\f0 
\par \fs16 
\par }
30
Scribble30
Start Button
Start



Done



FALSE
10
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Start Button
\par \cf0\b0\fs20 
\par \f1 This button starts the flocking simulation.  The simulation will execute a certain number of steps per second until you press the \cf2\strike Stop \cf3\strike0\{linkID=40\}\cf0 button (the \cf2\strike Simulation Steps Per Second\cf3\strike0\{linkID=120\}\cf0  specifies the maximum number of steps per second).  Every member, or boid, of a flock examines its surroundings and moves itself based on flocking rules currently active: separation, alignment, cohesion, and avoidance.  The \cf2\strike Behaviors \cf3\strike0\{linkID=50\}\cf0 checklist controls which flocking rules are active.
\par 
\par All controls are still active when the simulation is executing and may be changed dynamically.\f0 
\par 
\par \fs16 
\par }
40
Scribble40
Stop Button
Stop



Done



FALSE
7
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Stop Button
\par \cf0\b0\fs20 
\par \f1 The Stop button stops execution of the simulation started with the \cf2\strike Start \cf3\strike0\{linkID=30\}\cf0 button.\f0 
\par \fs16 
\par }
50
Scribble50
Behaviors Checklist
Behaviors



Done



FALSE
12
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}{\f2\fnil\fcharset2 Symbol;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Behaviors Checklist
\par \cf0\b0\fs20 
\par \f1 The Behaviors checklist controls which flocking rules each flock member, or boid, will execute.  If a behavior is checked, the boid will execute that flocking rule.  The different strength trackbars however; \cf2\strike Separation Strength\cf3\strike0\{linkID=60\}\cf0 , \cf2\strike Alignment Strength\cf3\strike0\{linkID=70\}\cf0 , \cf2\strike Cohesion Strength\cf3\strike0\{linkID=80\}\cf0 , and \cf2\strike Avoidance Strength\cf3\strike0\{linkID=90\}\cf0 ; also affect how much each rule affects the boid's movement.
\par 
\par \pard{\pntext\f2\'B7\tab}{\*\pn\pnlvlblt\pnf2\pnindent0{\pntxtb\'B7}}\fi-200\li200 Separation means that each member, or boid, of a flock tries to keep a minimum distance from every other boid in the flock.  
\par {\pntext\f2\'B7\tab}Alignment means that each boid tries to go in the same direction as the rest of the flock.  
\par {\pntext\f2\'B7\tab}Cohesion means that each boid tries to get as close as possible to the rest of the flock (huddle together). 
\par {\pntext\f2\'B7\tab}Avoidance means each boid tries to not get too close, or avoid, boids in other flocks.\f0 
\par {\pntext\f2\'B7\tab}\pard 
\par }
60
Scribble60
Separation Strength
Separation Strength



Done



FALSE
10
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Separation Strength
\par \cf0\b0\fs20 
\par \f1 The Separation Strength controls how much the Separation Flocking rule will affect flock members.  All the way to the left means that the Separation rule will not affect the flock boids.  All the way to the right means the Separation rule affects the boids fully.  Note that this strength is ignored if the rule is not checked in the \cf2\strike Behaviors checklist\cf3\strike0\{linkID=50\}\cf0 .
\par 
\par Separation means that each member, or boid, of a flock tries to keep a minimum distance from every other boid in the flock.
\par \f0 
\par \fs16 
\par }
70
Scribble70
Alignment Strength 
Alignment Strength 



Done



FALSE
10
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Alignment Strength 
\par \cf0\b0\fs20 
\par \f1 The Alignment Strength controls how much the Alignment Flocking rule will affect flock members.  All the way to the left means that the Alignment rule will not affect the flock boids.  All the way to the right means the Alignment rule affects the boids fully.  Note that this strength is ignored if the rule is not checked in the \cf2\strike Behaviors checklist\cf3\strike0\{linkID=50\}\cf0 .
\par 
\par Alignment means that each boid tries to go in the same direction as the rest of the flock.\f0\fs16 
\par \fs20 
\par \fs16 
\par }
80
Scribble80
Cohesion Strength 
Cohesion Strength 



Done



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Cohesion Strength 
\par \cf0\b0\fs20 
\par \f1 The Cohesion Strength controls how much the Cohesion Flocking rule will affect flock members.  All the way to the left means that the Cohesion rule will not affect the flock boids.  All the way to the right means the Cohesion rule affects the boids fully.  Note that this strength is ignored if the rule is not checked in the \cf2\strike Behaviors checklist\cf3\strike0\{linkID=50\}\cf0 .
\par 
\par Cohesion means that each boid tries to get as close as possible to the rest of the flock (huddle together).\f0\fs16 
\par }
90
Scribble90
Avoidance Strength
Avoidance Strength



Done



FALSE
9
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}{\f2\fnil\fcharset2 Symbol;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Avoidance Strength
\par \cf0\b0\fs20 
\par \f1 The Avoidance Strength controls how much the Avoidance Flocking rule will affect flock members.  All the way to the left means that the Avoidance rule will not affect the flock boids.  All the way to the right means the Avoidance rule affects the boids fully.  Note that this strength is ignored if the rule is not checked in the \cf2\strike Behaviors checklist\cf3\strike0\{linkID=50\}\cf0 .
\par 
\par \pard{\pntext\f2\'B7\tab}{\*\pn\pnlvlblt\pnf2\pnindent0{\pntxtb\'B7}}\fi-200\li200 Avoidance means each boid tries to not get too close, or avoid, boids in other flocks.\f0 
\par {\pntext\f2\'B7\tab}\pard\fs16 
\par }
100
Scribble100
Boids Per Flock 
Boids



Done



FALSE
7
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Boids Per Flock 
\par \cf0\b0\fs20 
\par \f1 The Boids Per Flock trackbar controls how many boids, or members, are in each flock.  Every flock has the same number of boids and all the members of a flock have the same color in the \cf2\strike Simulation View\cf3\strike0\{linkID=12\}\cf0 .  The range of the trackbar is from 2 to 100.\f0 
\par \fs16 
\par }
110
Scribble110
Number of Flocks
Flocks



Done



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Number of Flocks
\par \cf0\b0\fs20 
\par \f1 The Number of Flocks trackbar controls how many flocks are in the simulation.  Every flock has the same number of boids and all the members of a flock have the same color in the \cf2\strike Simulation View\cf3\strike0\{linkID=12\}\cf0 .  The range of the trackbar is from 1 to 10.\f0 
\par \fs16 
\par \f1\fs20 
\par }
120
Scribble120
Simulation Steps Per Second
Steps Second



Done



FALSE
10
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Simulation Steps Per Second
\par \cf0\b0\fs20 
\par \f1 The Simulation Steps Per Second trackbar controls the \i maximum\i0  number of steps in the simulation per second.  Every step all the flocks and all the boids in those flocks move according to the flocking rules.  The range of the trackbar is from 1 step per second to 100 steps per second.  Note that the actual number of steps executed depends on your processor speed and simulation load.
\par 
\par This value is ignored until you start the simulation using the \cf2\strike Start button\cf3\strike0\{linkID=30\}\cf0 .\f0 
\par 
\par \fs16 
\par }
130
Scribble130
Follow Mouse
Follow Mouse



Done



FALSE
7
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Follow Mouse
\par \cf0\b0\fs20 
\par \f1 The Follow Mouse checkbox controls whether the FIRST flock will try to follow the mouse.  If the box is checked, the FIRST flock will attempt to follow the mouse cursor wherever it is over the \cf2\strike Simulation View\cf3\strike0\{linkID=12\}\cf0 .  The flock is actually using the mouse cursor to define the flock's position, or center point.  The Cohesion rule uses this center point to attempt to guide each flock member, or boid, to the center of the flock.  The strengths of the other flocking rules, however, can override this behavior.  You may need to turn down the \cf2\strike Separation Strength\cf3\strike0\{linkID=60\}\cf0 , \cf2\strike Alignment Strength\cf3\strike0\{linkID=70\}\cf0 , and \cf2\strike Avoidance Strength\cf3\strike0\{linkID=90\}\cf0  to easily see the behavior (as a suggestion, HALF the \cf2\strike Cohesion Strength\cf3\strike0\{linkID=80\}\cf0 ).
\par \f0\fs16 
\par }
0
0
0
0
6
*InternetLink
-2147483640
Courier New
0
10
1
....
0
0
0
0
0
0
*ParagraphTitle
-2147483640
Arial
0
11
1
B...
0
0
0
0
0
0
*PopupLink
-2147483640
Arial
0
8
1
....
0
0
0
0
0
0
*PopupTopicTitle
16711680
Arial
0
10
1
B...
0
0
0
0
0
0
*TopicText
-2147483640
Arial
0
10
1
....
0
0
0
0
0
0
*TopicTitle
16711680
Arial
0
16
1
B...
0
0
0
0
0
0
