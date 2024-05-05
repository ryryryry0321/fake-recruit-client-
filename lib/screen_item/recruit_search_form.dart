import 'package:fakerecruit/model/RecruitInfo.dart';
import 'package:fakerecruit/screen_item/recruit_item_grid.dart';
import 'package:fakerecruit/service/APIConnector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ファイル名とクラス名は必ずしもJavaのように紐づくものではないっぽい
class RecruitSearch extends StatefulWidget {
  const RecruitSearch({super.key});

  @override
  State<RecruitSearch> createState() => _RecruitSearchState();
}

class _RecruitSearchState extends State<RecruitSearch> {
  List<RecruitInfo> recruits = [];

  final APIConnector connector = APIConnector();

  var testNow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
        'Fake Recruit APP',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white
          ),
          textAlign: TextAlign.center
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          // 検索ボックス
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 36,
            ),
            child: TextField(
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.search),
                //border: OutlineInputBorder(),
                hintText: '募集を検索',
              ),
              onSubmitted: (String value) async {
                final results = await connector.search(value);
                setState(() => recruits = results); // 検索結果を代入
              },
            ),
          ),

          Expanded(
            child: ListView(
              children: recruits
                  .map((recruit) => RecruitItem(recruitInfo: recruit))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
