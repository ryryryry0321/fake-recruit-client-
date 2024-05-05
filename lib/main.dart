import 'package:fakerecruit/screen_item/recruit_search_form.dart';
import 'package:fakerecruit/service/APIConnector.dart';
import 'package:flutter/material.dart';

void main() {
  //testPrintEntity();
  runApp(const MyApp());
}

// 無事に通信できることを確認
void testPrintEntity() {
  final connector = APIConnector();
  connector.search("Rails");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RecruitSearch()
    );
  }
}


