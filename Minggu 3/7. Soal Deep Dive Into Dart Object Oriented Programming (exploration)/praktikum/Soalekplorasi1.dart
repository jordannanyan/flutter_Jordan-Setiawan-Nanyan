class Shape {
  getArea() {
    return 0;
  }

  getPerimeter() {
    return 0;
  }
}

class Circle implements Shape {
  int radius = 5;

  @override
  getArea() {
    return 3.14 * (radius * radius);
  }

  @override
  getPerimeter() {
    return 3.14 * (2 * radius);
  }
}

class Square implements Shape {
  int side = 5;

  @override
  getArea() {
    return side * side;
  }

  @override
  getPerimeter() {
    return side * 4;
  }
}

class Rectangle implements Shape {
  int width = 5;
  int height = 10;

  @override
  getArea() {
    return width * height;
  }

  @override
  getPerimeter() {
    return (width + height) * 2;
  }
}

void main() {
  var shape = Shape();
  var circle = Circle();
  var square = Square();
  var retangle = Rectangle();

  print(shape.getArea());
  print(shape.getPerimeter());

  print("Luas Lingkaran");
  print(circle.getArea());
  print("Keliling Lingkaran");
  print(circle.getPerimeter());
  print("Luas Persegi");
  print(square.getArea());
  print("Keliling Persegi");
  print(square.getPerimeter());
  print("Luas Persegi");
  print(retangle.getArea());
  print("Keliling Persegi");
  print(retangle.getPerimeter());
}
