// Dependencies
import 'dart:developer';

// Abstract Class
abstract class GraphicObject {
  void draw();
}

// Error: Can't be instantiated/ constructed
GraphicObject graphicObject = GraphicObject();

// Can be extended
class Triangle extends GraphicObject {
  @override
  void draw() => print('Drawing Triangle');
}

// Can be implemented
class Quadrilateral implements GraphicObject {
  @override
  void draw() => log('Drawing Quadrilateral');
}

// Can't be mixed
class Pentagon with GraphicObject {
  @override
  void draw() => log('Drawing Pentagon');
}

// If you want to instantiate abstract class, use a factory constructor.
enum ShapeType { triangle, quadrilateral, pentagon }

abstract class Shape {
  factory Shape(ShapeType type) {
    switch (type) {
      case ShapeType.triangle:
        return Shape(ShapeType.triangle);
      case ShapeType.quadrilateral:
        return Shape(ShapeType.triangle);
      case ShapeType.pentagon:
        return Shape(ShapeType.triangle);
    }
  }
}

// Abstract class with factory constructor can be instantiated
Shape triangle = Shape(ShapeType.triangle);
Shape quadrilateral = Shape(ShapeType.quadrilateral);
Shape pentagon = Shape(ShapeType.pentagon);
