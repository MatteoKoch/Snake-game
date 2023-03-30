class Grid {

  int size;
  int n;
  int vx = 1;
  int vy = 0;
  Coordinates[][] grid;
  ArrayList<Coordinates> p;
  int x, y, px, py;
  int score = 1;
  int count = -1;
  
  Grid(int gridsize, int n_) {
    this.x = 7;
    this.y = 4;
    this.size = gridsize;
    this.n = n_;
    this.grid = new Coordinates[2*this.n][2*this.n];
    p = new ArrayList<Coordinates>();
    ellipseMode(RADIUS);
  }
  
  void make() {
    for(int sizex = 0; sizex < this.n; sizex++) {
      for(int sizey = 0; sizey < this.n; sizey++) {
        this.grid[sizex][sizey] = new Coordinates(this.size*sizex, this.size*sizey);
      }
    }
    this.grid[15][3].apple = true;
  }
  
  
  void mov() {
    
    for(int i = count-score; i >= 0; i--) {    
      this.grid[p.get(i).x][p.get(i).y].state = false;
    }
    
    count++;
    Coordinates c = new Coordinates(x,y);
    p.add(c);
    
    x+=vx;
    y+=vy;
    x%=this.n;
    y%=this.n;
    if(x < 0) x = 19;
    if(y < 0) y= 19;
    checkapple();
    checkcollision();
    for(int i = count; i > count-score; i--) {
      this.grid[p.get(i).x][p.get(i).y].state = true;
    }
    
  }
  
  void checkcollision() {

    for(int i = count; i > count-score; i--) {
      if(p.get(i).x == x && p.get(i).y == y) {
        println("Game Over!");
        println("score: "+score);
        noLoop();
      }
    }
 
  }
  
  void checkapple() {

    if(grid[x][y].apple) {
      grid[x][y].apple = false;
      score++;
      spawnapple();
    }
 
  }
  
  
  void spawnapple() {
    int rx = (int)(random(20));
    int ry = (int)(random(20));
    if(this.grid[rx][ry].state) {
      spawnapple();
    } else this.grid[rx][ry].apple = true;
  }
  
  void show() {
    stroke(200);
    strokeWeight(2);
    for(int x = this.size; x < width; x+=this.size) {
      line(x, 0, x, height);
      line(0, x, width, x);
    }
    for(int sizex = 0; sizex < this.n; sizex++) {
      for(int sizey = 0; sizey < this.n; sizey++) {
        color c = this.grid[sizex][sizey].state? color(180):(this.grid[sizex][sizey].apple? color(200,10,10):color(20));
        fill(c);
        rect(this.grid[sizex][sizey].x, this.grid[sizex][sizey].y, size, size);
      }
    }
    textSize(40);
    fill(200,10,10);
    text(score, 20, 40);
  }
  
}
