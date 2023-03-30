int n = 20;
int step;
Grid grid;
char k;
int tick = 100;

void setup() {
    size(500, 500);
    background(20);
    this.step = width/this.n;
    this.grid = new Grid(this.step, this.n);
    this.grid.make();

}

void draw() {
    background(20);
    this.grid.mov();
    this.grid.show();
    delay(tick);
}

void keyPressed() {
  switch(key) {
    case 'w':
      if(k != 's') {
        k = 'w';
        this.grid.vy = -1;
        this.grid.vx = 0;
      }
      break;
    case 's':
      if(k != 'w') {
        k = 's';
        this.grid.vy = 1;
        this.grid.vx = 0;
      }
    break;
    case 'a':
      if(k != 'd') {
        k = 'a';
        this.grid.vy = 0;
        this.grid.vx = -1;
      }
    break;
    case 'd':
      if(k != 'a') {
        k = 'd';
        this.grid.vy = 0;
        this.grid.vx = 1;
      }
    break;
  }
}
