import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('Quiz starts and displays first question', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the StartScreen is displayed.
    expect(find.text('Start Quiz'), findsOneWidget);

    // Tap the 'Start Quiz' button and trigger a frame.
    await tester.tap(find.text('Start Quiz'));
    await tester.pumpAndSettle();

    // Verify that the QuestionsScreen is displayed.
    expect(find.text('What is an algorithm?'), findsOneWidget);
  });
}
