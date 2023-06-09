public class PuffBall {
  private int duration;
  private float startRadius, endRadius, currentRadius;
  private float x, y;
  private float spawnedAt;
  private color startColour, endColour, currentColour;

  public PuffBall(int duration, float startRadius, float endRadius, float x, float y, color startColour, color endColour) {
    setDuration(duration);
    setStartRadius(startRadius);
    setEndRadius(endRadius);
    setX(x);
    setY(y);
    setStartColour(startColour);
    setEndColour(endColour);
    this.spawnedAt = millis();
  }

  public PuffBall(float x, float y, color startColour) {
    this(1000, 4, 20, x, y, startColour, color(255, 255, 255, 0));
  }

  // Update method that changes colour and radius over time
  public void update() {
    float livedFor = millis() - spawnedAt;
    float percentComplete = livedFor / duration;

    setCurrentColour(lerpColor(getStartColour(), getEndColour(), percentComplete));
    setCurrentRadius(lerp(getStartRadius(), getEndRadius(), percentComplete));
  }

  // Display method that draws the PuffBall if it's not expired
  public void display() {
    if (!isExpired()) {
      fill(getCurrentColour());
      circle(getX(), getY(), getCurrentRadius());
    }
  }


  // Checks if the PuffBall is expired (i.e., reached the end of its duration)
  public boolean isExpired() {
    return (millis() - spawnedAt) >= duration;
  }

  /*********************/
  /* Getters & Setters */
  /*********************/

  public void setDuration(int duration) {
    this.duration = duration;
  }

  public void setStartRadius(float startRadius) {
    this.startRadius = startRadius;
  }

  public void setEndRadius(float endRadius) {
    this.endRadius = endRadius;
  }

  public void setCurrentRadius(float currentRadius) {
    this.currentRadius = currentRadius;
  }

  public void setX(float x) {
    this.x = x;
  }

  public void setY(float y) {
    this.y = y;
  }

  public void setStartColour(color startColour) {
    this.startColour = startColour;
  }

  public void setEndColour(color endColour) {
    this.endColour = endColour;
  }

  public void setCurrentColour(color currentColour) {
    this.currentColour = currentColour;
  }

  public int getDuration() {
    return this.duration;
  }

  public float getStartRadius() {
    return this.startRadius;
  }

  public float getEndRadius() {
    return this.endRadius;
  }

  public float getCurrentRadius() {
    return this.currentRadius;
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public color getStartColour() {
    return this.startColour;
  }

  public color getEndColour() {
    return this.endColour;
  }

  public color getCurrentColour() {
    return this.currentColour;
  }
}
