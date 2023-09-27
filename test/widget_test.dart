import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('TextField Widget', (widgetTester)async{
    await widgetTester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: TextField(),
      ),
    ));
    final textFieldFinder = find.byType(TextField);
    await widgetTester.enterText(textFieldFinder, 'Hello, Flutter!');
    
     await widgetTester.pump();
    expect(find.text('Hello, Flutter!'), findsOneWidget);
  });
}