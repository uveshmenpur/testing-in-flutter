import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_in_flutter/widget_test/home_screen_user.dart';
import 'package:testing_in_flutter/widget_test/user_model.dart';

void main() {
  testWidgets(
    'Displays List of users with title as name and  subtitle as email',
        (tester) async {

      /// Mock Data
      final users = [
        User(id: 1, name: 'Rivaan', email: 'rivaan@gmail.com'),
        User(id: 2, name: 'Naman', email: 'naman@gmail.com'),
      ];

      /// Mock API response
      Future<List<User>> mockFetchUsers() {
        return Future.delayed(
          const Duration(seconds: 1),
              () => users,
        );
      }

      /// Initialize the widget tree
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreenUser(
            futureUsers: mockFetchUsers(),
          ),
        ),
      );

      /// Find Circular Progress Indicator if data is not fetched from API
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      /// Rebuild Widgets until the data is fetched from API or Async Function Completes
      await tester.pumpAndSettle();

      /// Find a listview after data is fetched from API
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(users.length));

      /// Test if List is containing data that we received in API
      for (final user in users) {
        expect(find.text(user.name), findsOneWidget);
        expect(find.text(user.email), findsOneWidget);
      }
    },
  );
}
