import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_in_flutter/widget_test/home_page.dart';
import 'package:testing_in_flutter/widget_test/home_screen_user.dart';
import 'package:testing_in_flutter/widget_test/user_model.dart';

void main() {

  /// Counter Application Test
  /// Function to test widgets
  testWidgets(
    'given counter is 0 when increment button is clicked then counter should be 1',
    (tester) async {

      /// pumpWidget method is used to render the given widget
      /// after it is rendered we can search for whatever we want to search in that widget
      /// this function means we are starting or  restarting the application
      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePageScreen(
            title: 'Counter App',
          ),
        ),
      );

      /// Search one widget that contains'0'
      final ctr = find.text('0');
      expect(ctr, findsOneWidget);

      /// check that any widget containing '1' is not in the UI
      final ctr2 = find.text('1');
      expect(ctr2, findsNothing);

      /// Fina a button using KEY and press that button using [tester]
      /// [tester.tap] can be used to press the button
      final incrementBtn = find.byKey(const Key('increment_counter'));
      await tester.tap(incrementBtn);

      /// this method mocks the functionality of [setState]
      /// this method is used to rebuild the widgets.
      await tester.pump();

      /// Search one widget that has contains'1'
      /// After we have incremented counter
      final ctr3 = find.text('1');
      expect(ctr3, findsOneWidget);

      /// check that any widget containing '0' is not in the UI as the counter has incremented
      final ctr4 = find.text('0');
      expect(ctr4, findsNothing);

      /// check if our UI contains one AppBar
      expect(find.byType(AppBar), findsOneWidget);
    },
  );


  /// User Application Test
  testWidgets(
    'Displays List of users with title as name and  subtitle as email',
        (tester) async {
      final users = [
        User(id: 1, name: 'Rivaan', email: 'rivaan@gmail.com'),
        User(id: 2, name: 'Naman', email: 'naman@gmail.com'),
      ];

      Future<List<User>> mockFetchUsers() {
        return Future.delayed(
          const Duration(seconds: 1),
              () => users,
        );
      }

      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreenUser(
            futureUsers: mockFetchUsers(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(users.length));

      for (final user in users) {
        expect(find.text(user.name), findsOneWidget);
        expect(find.text(user.email), findsOneWidget);
      }
    },
  );
}
