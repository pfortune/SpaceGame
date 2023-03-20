class Pickup {
  float x, y, size;

  public Pickup(float x, float y, float size) {
    setX(x);
    setY(y);
    setSize(size);
  }

  public void setX(float x) {
    this.x = x;
  }

  public float getX() {
    return this.x;
  }

  public void setY(float y) {
    this.y = y;
  }

  public float getY() {
    return this.y;
  }

  public void setSize(float size) {
    this.size = size;
  }

  public float getSize() {
    return this.size;
  }

  public void drawHealthPickup() {
    // Outer circle (ellipse)
    fill(255, 30, 30);
    ellipse(getX(), getY(), 20 * getSize(), 20 * getSize());

    // Inner circle (ellipse)
    fill(255, 0, 0);
    ellipse(getX(), getY(), 10 * getSize(), 10 * getSize());

    // Vertical rectangle
    fill(255);
    rect(getX() - 2 * getSize(), getY() - 7 * getSize(), 4 * getSize(), 14 * getSize());

    // Horizontal rectangle
    fill(255);
    rect(getX() - 7 * getSize(), getY() - 2 * getSize(), 14 * getSize(), 4 * getSize());
  }

  void drawMissilePickup(float x, float y, float size) {
    // Outer circle (ellipse)
    fill(190, 190, 190);
    ellipse(getX(), getY(), 20 * getSize(), 20 * getSize());

    // Main body (rectangle)
    fill(255, 255, 255);
    rect(getX() - 2 * getSize(), getY() - 2 * getSize(), 4 * getSize(), 8 * getSize());

    // Tip (triangle)
    fill(255, 0, 0);
    triangle(getX(), getY() - 8 * getSize(), getX() - 2 * getSize(), getY() - 2 * getSize(), getX() + 2 * getSize(), getY() - 2 * getSize());
  }
}