import 'person.dart';

class Teacher extends Person {
  const Teacher({
    required super.id,
    required super.name,
    required this.subjects,
  });

  final List<String> subjects;
}