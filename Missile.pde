public class Missile {
  // Declare instance variables
  private float x, y, w, h, speed, payload;
  private color colour;
  private int lifetime;
  private int timeSpawned;
  private BoundingBox boundingBox;
  private PuffBall explosion;
  private Vector2 direction;

  // Constructor for Missile class
  public Missile(float x, float y, Vector2 dir) {
    this();
    setX(x);
    setY(y);
    setDirection(dir);
    setLifetime(5000);
    setTimeSpawned(millis());
  }

  // Default constructor for Missile class
  public Missile() {
    setPayload(50);
    setWidth(getPayload()/10);
    setHeight(getPayload()/3);
    setSpeed(getPayload()/10);
    setColour(color(255, 0, 155));
    // Create a new BoundingBox for the missile
    this.boundingBox = new BoundingBox(getX(), getY(), getWidth(), getHeight());
  }

  // Update the missile's position and its BoundingBox
  public void update() {
    if (explosion == null) {
      setX(getX() + direction.x * speed);
      setY(getY() + direction.y * speed);
      boundingBox.setX(getX());
      boundingBox.setY(getY());
    } else {
      y -= speed/5;
    }
  }

  // Check if the missile is ready to be cleaned up
  public boolean readyForCleanup() {
    // If the missile has been alive for more than its lifetime, return true
    if (millis() - getTimeSpawned() >= getLifetime()) {
      return true;
    }

    // If the missile has exploded and the explosion has finished, return true
    if (explosion != null && explosion.isExpired()) {
      return true;
    }

    return false;
  }

  // Create an explosion at the missile's current location
  public void explode() {
    explosion = new PuffBall(750, getPayload()/5, getPayload()*2, getX(), getY(), color(255, 255, 125, 255), color(255, 255, 255, 0));
    boundingBox = null;
  }

  // Check if the missile has expired
  public boolean isExpired() {
    if (explosion == null) {
      return false;
    }

    return explosion.isExpired();
  }

  // Display the missile on the screen
  public void display() {
    if (explosion == null) {
      fill(getColour());
      rect(getX() - (getWidth() / 2), getY() - (getHeight() / 2), getWidth(), getHeight());
    } else {
      // Update and display the explosion
      explosion.setY(y);
      explosion.update();
      explosion.display();
    }
  }

  /*********************/
  /* Getters & Setters */
  /*********************/

  public void setX(float x) {
    this.x = x;
  }

  public void setY(float y) {
    this.y = y;
  }

  public void setWidth(float w) {
    this.w = w;
  }

  public void setHeight(float h) {
    this.h = h;
  }

  public void setSpeed(float speed) {
    this.speed = speed;
  }

  public void setColour(color colour) {
    this.colour = colour;
  }

  public void setPayload(float payload) {
    this.payload = payload;
  }

  public void setBoundingBox(BoundingBox boundingBox) {
    this.boundingBox = boundingBox;
  }

  public void setExplosion(PuffBall explosion) {
    this.explosion = explosion;
  }

  public void setDirection(Vector2 direction) {
    this.direction = direction;
  }

  public void setLifetime(int lifetime) {
    this.lifetime = lifetime;
  }

  public void setTimeSpawned(int timeSpawned) {
    this.timeSpawned = timeSpawned;
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public float getWidth() {
    return this.w;
  }

  public float getHeight() {
    return this.h;
  }

  public float getSpeed() {
    return this.speed;
  }

  public color getColour() {
    return this.colour;
  }

  public float getPayload() {
    return this.payload;
  }

  public BoundingBox getBoundingBox() {
    return this.boundingBox;
  }

  public PuffBall getExplosion() {
    return this.explosion;
  }

  public Vector2 getDirection() {
    return this.direction;
  }

  public int getLifetime() {
    return this.lifetime;
  }

  public int getTimeSpawned() {
    return this.timeSpawned;
  }
}
