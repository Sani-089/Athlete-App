// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:athleteapp/main.dart'; // Impor file main.dart

void main() {
  testWidgets('Smartband App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp()); // Gunakan MyApp sebagai root widget

    // Verifikasi bahwa widget utama ditampilkan.
    expect(find.byType(AppBar), findsOneWidget); // AppBar ada
    expect(find.byType(Image), findsOneWidget); // Gambar ada
    expect(find.text('Go to Next Page'), findsOneWidget); // Tombol ada
  });
}
