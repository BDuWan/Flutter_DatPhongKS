import 'package:booking_hotel/Screens/LoginScreen.dart';
import 'package:booking_hotel/Screens/RegisterScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:booking_hotel/main.dart';
import 'package:booking_hotel/Screens/IntroScreen.dart';

import 'mock.dart';

void main() {

  setUpAll(() async {
    setupFirebaseAuthMocks();
    await Firebase.initializeApp();
  });

  testWidgets('IntroScreen navigate to LoginScreen',
      (WidgetTester tester) async {
    // Build the MyApp widget
    await tester.pumpWidget(const MyApp());
    expect(find.byType(IntroScreen), findsOneWidget);
    expect(find.byKey(const Key('loginButton')), findsOneWidget);

    // Tap the "Đăng nhập" button
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();
    expect(find.byType(LoginScreen), findsOneWidget);
  });

  testWidgets('IntroScreen navigate to RegisterScreen',
      (WidgetTester tester) async {
    // Build the MyApp widget
    await tester.pumpWidget(const MyApp());
    expect(find.byType(IntroScreen), findsOneWidget);
    expect(find.byKey(const Key('registerButton')), findsOneWidget);

    await tester.tap(find.byKey(const Key('registerButton')));
    await tester.pumpAndSettle();
    expect(find.byType(RegisterScreen), findsOneWidget);
  });

  testWidgets('RegisterScreen Widget Test', (WidgetTester tester) async {
    // Build RegisterScreen widget
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));
    // Tìm các TextFormField bằng Key
    final emailField = find.byKey(const Key('emailField'));
    final fullnameField = find.byKey(const Key('fullnameField'));
    final phoneField = find.byKey(const Key('phoneField'));
    final addressField = find.byKey(const Key('addressField'));
    final passwordField = find.byKey(const Key('passwordField'));
    final repasswordField = find.byKey(const Key('repasswordField'));

    // Kiểm tra xem các TextFormField đã được tìm thấy hay chưa
    expect(emailField, findsOneWidget);
    expect(fullnameField, findsOneWidget);
    expect(phoneField, findsOneWidget);
    expect(addressField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(repasswordField, findsOneWidget);

    // Kiểm tra giá trị ban đầu của các TextFormField
    expect((tester.widget(emailField) as TextFormField).initialValue, '');
    expect((tester.widget(fullnameField) as TextFormField).initialValue, '');
    expect((tester.widget(phoneField) as TextFormField).initialValue, '');
    expect((tester.widget(addressField) as TextFormField).initialValue, '');
    expect((tester.widget(passwordField) as TextFormField).initialValue, '');
    expect((tester.widget(repasswordField) as TextFormField).initialValue, '');

    // Gửi giá trị mới cho các TextFormField
    await tester.enterText(fullnameField, 'Test User');
    await tester.enterText(phoneField, '123456789');
    await tester.enterText(addressField, 'Test Address');
    await tester.enterText(passwordField, '123456');
    await tester.enterText(repasswordField, '123457');
    await tester.pump();

    // Kiểm tra xem giá trị của các TextFormField đã được cập nhật hay chưa
    expect((tester.widget(fullnameField) as TextFormField).initialValue,
        'Test User');
    expect((tester.widget(phoneField) as TextFormField).initialValue,
        '123456789');
    expect((tester.widget(addressField) as TextFormField).initialValue,
        'Test Address');
    expect((tester.widget(passwordField) as TextFormField).initialValue,
        '123456');
    expect((tester.widget(repasswordField) as TextFormField).initialValue,
        '123457');
    expect(find.byKey(const Key('registerButton1')), findsOneWidget);
    // Tìm và nhấn nút Đăng kí
    await tester.ensureVisible(find.byKey(const Key('registerButton1')));
    await tester.tap(find.byKey(const Key('registerButton1')));
    await tester.pumpAndSettle();
    expect(find.text('Bạn chưa nhập email'), findsOneWidget);
    expect(find.text('Mật khẩu nhập lại không khớp'), findsOneWidget);
  });

  testWidgets('RegisterScreen Widget Test2', (WidgetTester tester) async {
    // Build RegisterScreen widget
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));
    // Tìm các TextFormField bằng Key
    final emailField = find.byKey(const Key('emailField'));
    final fullnameField = find.byKey(const Key('fullnameField'));
    final phoneField = find.byKey(const Key('phoneField'));
    final addressField = find.byKey(const Key('addressField'));
    final passwordField = find.byKey(const Key('passwordField'));
    final repasswordField = find.byKey(const Key('repasswordField'));

    // Kiểm tra xem các TextFormField đã được tìm thấy hay chưa
    expect(emailField, findsOneWidget);
    expect(fullnameField, findsOneWidget);
    expect(phoneField, findsOneWidget);
    expect(addressField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(repasswordField, findsOneWidget);

    // Kiểm tra giá trị ban đầu của các TextFormField
    expect((tester.widget(emailField) as TextFormField).initialValue, '');
    expect((tester.widget(fullnameField) as TextFormField).initialValue, '');
    expect((tester.widget(phoneField) as TextFormField).initialValue, '');
    expect((tester.widget(addressField) as TextFormField).initialValue, '');
    expect((tester.widget(passwordField) as TextFormField).initialValue, '');
    expect((tester.widget(repasswordField) as TextFormField).initialValue, '');

    // Gửi giá trị mới cho các TextFormField
    await tester.enterText(emailField, 'test@gmail.com');
    await tester.enterText(fullnameField, 'Test User');
    await tester.enterText(phoneField, '123456789');
    await tester.enterText(addressField, 'Test Address');
    await tester.enterText(passwordField, '123456');
    await tester.enterText(repasswordField, '123456');
    await tester.pump();

    // Kiểm tra xem giá trị của các TextFormField đã được cập nhật hay chưa
    expect((tester.widget(emailField) as TextFormField).initialValue,
        'test@gmail.com');
    expect((tester.widget(fullnameField) as TextFormField).initialValue,
        'Test User');
    expect((tester.widget(phoneField) as TextFormField).initialValue,
        '123456789');
    expect((tester.widget(addressField) as TextFormField).initialValue,
        'Test Address');
    expect((tester.widget(passwordField) as TextFormField).initialValue,
        '123456');
    expect((tester.widget(repasswordField) as TextFormField).initialValue,
        '123456');
    expect(find.byKey(const Key('registerButton1')), findsOneWidget);

    // Tìm và nhấn nút Đăng kí
    await tester.ensureVisible(find.byKey(const Key('registerButton1')));
    await tester.tap(find.byKey(const Key('registerButton1')));
    await tester.pump();
    expect(find.text('Vui lòng đợi'), findsOneWidget);
  });
}
