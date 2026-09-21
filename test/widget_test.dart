import 'package:example_dart/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Lab 4 home displays two exercises', (tester) async {
    await tester.pumpWidget(const Lab4App());

    expect(find.text('Lab 4 - Flutter UI'), findsOneWidget);
    expect(find.text('Exercise 1'), findsOneWidget);
    expect(find.text('Exercise 2'), findsOneWidget);
  });
}
