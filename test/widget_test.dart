import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  for (final width in [320.0, 390.0, 768.0]) {
    testWidgets('Profile layout fits a $width pixel viewport', (tester) async {
      tester.view.physicalSize = Size(width, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const MyApp());
      expect(find.text('Personal center'), findsOneWidget);
      expect(find.text('Mausam Rayamajhi'), findsOneWidget);
      await tester.scrollUntilVisible(find.text('Notifications'), 150);
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets('Layout supports larger accessibility text', (tester) async {
    tester.view.physicalSize = const Size(320, 700);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(textScaler: TextScaler.linear(1.8)),
          child: ProfileScreen(),
        ),
      ),
    );
    await tester.scrollUntilVisible(find.text('Notifications'), 150);
    expect(tester.takeException(), isNull);
  });
}
