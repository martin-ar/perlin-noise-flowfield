// Daniel Shiffman
// http://youtube.com/thecodingtrain
// http://codingtra.in
//
// Coding Challenge #24: Perlin Noise Flow  Field
// https://youtu.be/BjoM9oKOAKY

FlowField flowfield;
ArrayList<Particle> particles;

boolean debug = false;
PImage img ; 

int colorVector [];
color colorArray [];


color c ; 

void setup() {
  size(1200, 800);
  
  img = loadImage("1.jpg");
 
  flowfield = new FlowField(10);
  flowfield.update();
  

  particles = new ArrayList<Particle>();
  for (int i = 0; i < 10000; i++) {
    PVector start = new PVector(random(width), random(height));
    particles.add(new Particle(start, random(2, 8)));
  }
  background(255);
}

void draw() {
  flowfield.update();
  
  if (debug) flowfield.display();
  
  for (Particle p : particles) {
    p.follow(flowfield);
    p.setColorByImage(colorArray);
    p.run();
  }
}
