class Vector {
  float x, y;

  Vector(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  Vector() {
    this.x = 0;
    this.y = 0;
  }

  Vector copy() {
    return new Vector(x, y);
  }
  
  float mag() {
    return sqrt(x*x + y*y);
  }
  
  Vector mag(float m) {
    return normalize().mult(m);
  }
  
  float heading() {
    return atan2(y, x);
  }
  
  Vector add(Vector v) {
    return new Vector(x+v.x, y+v.y);
  }

  Vector add(float x, float y) {
    return new Vector(this.x+x, this.y+y);
  }

  Vector sub(Vector v) {
    return new Vector(x-v.x, y-v.y);
  }

  Vector sub(float x, float y) {
    return new Vector(this.x-x, this.y-y);
  }

  Vector mult(float n) {
    return new Vector(x*n, y*n);
  }

  Vector div(float n) {
    return new Vector(x/n, y/n);
  }
  
  float dot(Vector v) {
    return x*v.x + y*v.y;
  }

  float cross(Vector v) {
    return x*v.y - v.x*y;
  }
  
  Vector normalize() {
    float m = mag();
    if (m != 0 && m != 1) return div(m);
    return copy();
  }
  
  Vector limit(float m) {
    return mag(min(mag(), m));
  }

  Vector rotate(float a) {
    Vector v = new Vector();
    v.x = cos(a)*x - sin(a)*y;
    v.y = sin(a)*x + cos(a)*y;
    return v;
  }

  Vector perpendicular() {
    return new Vector(-y, x);
  }

  float distance(Vector v) {
    float dx = x-v.x;
    float dy = y-v.y;
    return sqrt(dx*dx + dy*dy);
  }

  float angleBetween(Vector v) {
    Vector a = copy().normalize();
    Vector b = v.copy().normalize();
    return acos(a.dot(b));
  }
}
