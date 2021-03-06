// A Bubble class

public class Polygon {
  int PLANO = 0;
  int CHIRIVITA = 1;
  int LLENADO = 2;

  public String name;
  List<PVector> rawPoints = new ArrayList<PVector>();  
  boolean over = false;
  color c;
  PGraphics pg;
  int drawMode;

  // Create  the Bubble
  public Polygon(String name) {
    this.name = name;
    c = color(random(255), random(255), random(255));
    pg = createGraphics(100, 100);
    drawMode = 0;
  }

  public void setColor(color c) {
    this.c = c;
  }

  public void addPoint(PVector point) {
    rawPoints.add(point);
  }

  int[][] textCoords = {
    {
      0, 0,
    }
    , 
    {
      1, 0,
    }
    , 
    {
      1, 1,
    }
    , 
    {
      0, 1,
    }
  };


  public void draw(PGraphics canvas) {
     pg.beginDraw(); 
    if ( drawMode == CHIRIVITA) {
      pg.background(0 );
      pg.colorMode(HSB);
      pg.fill(c);
      int numPoints = 40;
      for (int i = 0; i < numPoints; i++)
        pg.rect(random(pg.width), random(pg.height), 8, 8);
    }
    else if (drawMode == PLANO) {
      pg.background(c);      
    }
    else if( drawMode == LLENADO){
      pg.background(0 );
      pg.fill(c);
      pg.rect(0, pg.height - frameCount % pg.height, pg.width,  frameCount % pg.height);
    }
    pg.endDraw();
    
    canvas.noStroke();
    canvas.beginShape();
    //canvas.fill(c);
    canvas.textureMode(NORMAL);
    canvas.texture(pg);
    for (int i = 0;i<rawPoints.size();i++) {
      PVector p = rawPoints.get(i);

      canvas.vertex(p.x, p.y, textCoords[i][0], textCoords[i][1]);
    }
    canvas.endShape();
  }

  void setMode(int i) {
    drawMode = i;
  }
}
