import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('TextField Widget', (widgetTester)async{
    await widgetTester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: TextField(),
      ),
    ));
     //  find.byType method to locate the TextField widget within the widget tree.
    final textFieldFinder = find.byType(TextField);
    //  tester.enterText method to simulate entering
    //the text "Hello, Flutter!" into the TextField.
    await widgetTester.enterText(textFieldFinder, 'Hello, Flutter!');
    //tester.pump to trigger a frame update, simulating the UI refresh.
     await widgetTester.pump();
    expect(find.text('Hello, Flutter!'), findsOneWidget);
  });
}