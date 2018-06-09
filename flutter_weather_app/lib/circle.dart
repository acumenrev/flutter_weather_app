
class Circle {
  final double radius;
  final int alpha;

  Circle({
    this.radius,
    this.alpha = 0xFF,
  });
}

List<Circle> circles = [
  new Circle(radius: 140.0, alpha: 0x10),
  new Circle(radius: 140.0 + 15, alpha: 0x28),
  new Circle(radius: 140.0 + 30, alpha: 0x38),
  new Circle(radius: 140.0 + 75, alpha: 0x50),
  
];