import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_in_flutter/widget_test/animation_widget_screen.dart';

void main() {
  testWidgets('Animation screen test', (tester) async {

    /// Build The Widget Tree
    await tester.pumpWidget(
      const MaterialApp(
        home: AnimationScreen(),
      ),
    );

    /// Find Container Widget in the tree
    var containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);
    var container = tester.widget<Container>(containerFinder);

    /// Test if the starting values of animations are as we have defined
    expect(container.constraints!.minWidth, 50);
    expect(container.constraints!.minHeight, 50);
    expect((container.decoration as BoxDecoration).color, Colors.blue);
    expect(
      (container.decoration as BoxDecoration).borderRadius,
      BorderRadius.zero,
    );

    /// Rebuild the widget until the animation is completed
    await tester.pumpAndSettle();

    /// Find the container again
    containerFinder = find.byType(Container);
    container = tester.widget<Container>(containerFinder);

    /// Test If the values values are end values after animation is completed
    expect(container.constraints!.minWidth, 200);
    expect(container.constraints!.minHeight, 200);
    expect((container.decoration as BoxDecoration).color, Colors.green);
    expect(
      (container.decoration as BoxDecoration).borderRadius,
      BorderRadius.circular(50),
    );
  });
}
