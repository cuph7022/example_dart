import 'student.dart';
import 'teacher.dart';

enum PersonType { student, teacher }

class Person {
  const Person({required this.id, required this.name});

  final String id;
  final String name;

  factory Person.create(PersonType personType, Map<String, dynamic> json) {
    switch (personType) {
      case PersonType.student:
        return Student(
          id: json['id'] as String,
          name: json['name'] as String,
          math: (json['math'] as num?)?.toDouble(),
          physics: (json['physics'] as num?)?.toDouble(),
          chemistry: (json['chemistry'] as num?)?.toDouble(),
        );

      case PersonType.teacher:
        final subjects = json['subjects'] as List<dynamic>? ?? const [];

        return Teacher(
          id: json['id'] as String,
          name: json['name'] as String,
          subjects: subjects.map((subject) => subject.toString()).toList(),
        );
    }
  }
}
