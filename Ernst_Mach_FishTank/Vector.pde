class Vector {
  // properties of the object go here
  float x;  // x value of the vector
  float y;  // y value of the vector

  // This is the default constructor
  Vector(float xValue, float yValue) {
    x = xValue;
    y = yValue;
  }

  // add two vectors together
  void add(Vector vector) {
    x += vector.x;
    y += vector.y;
  }

  // subtract two vectors
  Vector subtract(Vector vector, Vector vector2) {
    Vector ValueVector = new Vector(0, 0);
    ValueVector.x = vector.x-vector2.x;
    ValueVector.y = vector.y-vector2.y;
    return ValueVector;
  }

  // multiply the vector
  void multiply(float number) {
    x *= number;
    y *= number;
  }
}