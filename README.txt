= Spinny

This is a silly Rubygame demo that visualizes the connection cost of a
fully-connected graph, i.e. (n**2-n)/2 connections. It also
demonstrates framerate-independent animation and color cycling.

The graph rotation is just me showing off, to make the graph
interesting.


= Usage

Run it. Click to place nodes. Each node will be drawn interconnected
to all other nodes. That's it, that's the whole app.

Other stuff:

* The graph rotates. I find this visually satisfying, but then again,
  I am easily amused.

* The cost of each new connection is briefly shown in animation. Edges
  to the newest node are shown in a "hotter" color that cools to the
  regular edge color over a second or two.

* Because of the rotation, if you hold your mouse still and click at
  regularly-timed intervals, it will generate a regular polygon.

* Depending on your hardware, somewhere above 20 nodes the framerate
  will drop noticeably. This is an intended part of the demo: you ARE
  playing with an algorithm that executes in polynomial time, and
  adding many nodes will quickly overwhelm your processing budget.


= Installation

To run spinny, just run spinny.rb. But first, you need Rubygame. These
instructions detail how to set that up.

On MacOSX:

Condensed from http://rubygame.sourceforge.net/doc/2_2_0/files/doc/macosx_install_rdoc.html

  sudo port install libsdl
  sudo port install libsdl_gfx libsdl_image libsdl_mixer libsdl_ttf
  wget http://www.kumaryu.net/?c=plugin;plugin=attach_download;p=%28Ruby%29+Ruby%2FSDL%CD%D1ruby;file_name=rsdl.tar.gz 
  tar -zxvf rsdl.tar.gz
  cd rsdl
  make
  sudo cp rsdl /usr/local/bin

If any of that doesn't work on your machine, you're screwed. Go ask
Google; I have no clue how to debug SDL setup. Sorry about that.

On other OSes:

Noodle around on http://rubygame.sourceforge.net/


= Running Spinny

== MacOSX:

  rsdl spinny.rb

== Linux:

  ruby spinny.rb

