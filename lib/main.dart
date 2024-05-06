import 'package:fakerecruit/screen_item/recruit_search_form.dart';
import 'package:fakerecruit/service/APIConnector.dart';
import 'package:flutter/material.dart';

/**
 * 今回は画像をダミーで指定してるけど、真面目にやるなら
 * データモデルのカラムにimg-urlを追加でs3あげたものをセット
 * それをImage.networkで使う
 */
void main() {
  // testPrintEntity();
  runApp(const MyApp());
}

// 無事に通信できることを確認
void testPrintEntity() {
  final connector = APIConnector();
  connector.search("Rails");
  connector.findById(56);
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


