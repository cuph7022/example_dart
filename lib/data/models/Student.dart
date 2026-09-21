import 'person.dart';

class Student extends Person {
  const Student({
    required super.id,
    required super.name,
    this.math,
    this.physics,
    this.chemistry,
  });

  final double? math;
  final double? physics;
  final double? chemistry;
}
