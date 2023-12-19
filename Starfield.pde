// I'll actually make this good in a few months

int numParticles = 1000;

Particle[] particles = new Particle[numParticles];

void setup() {
  size(800, 600);
  
  for (int i = 0; i < (numParticles - (int)(numParticles / 20)); i++) {
    particles[i] = new Particle(0, 0, Math.random() * 10, (int)(Math.random() * 8));
  }
  
  for (int i = (numParticles - (int)(numParticles / 20)); i < numParticles; i++) {
    particles[i] = new OddballParticle(0, 0, Math.random() * 10, (int)(Math.random() * 8));
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < numParticles; i++) {
    particles[i].move();
    particles[i].show();
  }
}

class Particle {
  double xPos;
  double yPos;
  double angle;
  double speed;
  int radius;
  int r;
  int g;
  int b;
  
  Particle(double xPos, double yPos, double speed, int radius) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.speed = speed;
    this.radius = radius;
    this.angle = Math.random() * TWO_PI;
    this.r = (int)(Math.random() * 255);
    this.g = (int)(Math.random() * 255);
    this.g = (int)(Math.random() * 255);
  }
  
  void move() {
    this.xPos += cos((float)angle) * speed;
    this.yPos += sin((float)angle) * speed;
    
    if (xPos > 800 || xPos < -800 || yPos > 600 || yPos < -600) {
      this.xPos = 0;
      this.yPos = 0;
    }
  }
  
  void show() {
    pushMatrix();
    translate(width/2, height/2);
    fill(this.r, this.g, this.b);
    circle((float)this.xPos, (float)this.yPos, (float)this.radius);
    popMatrix();
  }
}

class OddballParticle extends Particle {
  OddballParticle(double xPos, double yPos, double speed, int radius) {
    super(xPos, yPos, speed, radius);
  }
  
  void move() {
    this.xPos += cos((float)angle) * speed + (speed) * ((int)(Math.random() * 2 - 1));
    this.yPos += sin((float)angle) * speed + (speed) * ((int)(Math.random() * 2 - 1));
    speed += (speed / 100);
  }
}
