import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project_for_bootcamp/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Ensure all bindings are initialized (needed if you use Firebase or Provider)
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Find the '+' button and tap it.
    final Finder incrementButton = find.byIcon(Icons.add);
    
    // Ensure the button exists before tapping
    expect(incrementButton, findsOneWidget);
    
    await tester.tap(incrementButton);
    await tester.pump(); // Rebuild UI after tap

    // Verify the counter increments to 1.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
