import 'package:fakerecruit/model/RecruitInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class RecruitSelectedItem extends StatelessWidget {
  const RecruitSelectedItem({
    super.key,
    required this.recruitInfo,
  });

  final RecruitInfo recruitInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Recruit APP',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center),
        backgroundColor: Colors.cyan,
        // 戻るボタン
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            // ボタンが押されたときの動作を指定します
            Navigator.of(context).pop();
          },
        ),
      ),
      bottomNavigationBar: bottomSideContactButton(),
      body: ShaderMask(
        shaderCallback: (bounds) {
          // グラデーションコンポーネント デフォは左右方向になる
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.transparent,
            ],
            // グラデーションの幅を指定
            stops: [
              0.8,
              1,
            ],
          ).createShader(bounds);
        },
        child: singleScrollItemById(),
      ),
    );
  }

  SingleChildScrollView singleScrollItemById() {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // 会社の写真
      Image.asset(
        height: 300,
        width: double.infinity, // 親要素の幅いっぱいに設置
        "lib/assets/image/engineer.jpeg",
        fit: BoxFit.fill,
      ),
      // 会社募集開始時期
      Text(
        '株式会社XXXXが${DateFormat('yyyy/MM/dd').format(recruitInfo.createdAt).toString()}に募集開始', // 表示したいテキスト
        style: const TextStyle(
            fontSize: 11, // テキストのフォントサイズ
            color: Colors.grey),
      ),
      // 募集タイトル
      Text(
        recruitInfo.needsTitle, // 表示したいテキスト
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      // ボタン群
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            goodButton(),
            supportButton(),
            entryButton(),
          ],
        ),
      ),
      // 業務について
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 18,
        ),
        child: Text(
          recruitInfo.workContext, // 表示したいテキスト
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 18,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              height: 150,
              width: 180, // 親要素の幅いっぱいに設置
              "lib/assets/image/office.png",
              fit: BoxFit.fill,
            ),
            Image.asset(
              height: 150,
              width: 180, // 親要素の幅いっぱいに設置
              "lib/assets/image/building.png",
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 18,
        ),
        child: Text(
          recruitInfo.workContext, // 表示したいテキスト
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      )
    ]));
  }

  ElevatedButton goodButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.favorite, color: Colors.pink),
      label: const Text(
        'いいね',
        style: TextStyle(fontSize: 11, color: Colors.black),
      ),
    );
  }

  ElevatedButton supportButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.support, color: Colors.pink),
      label: const Text(
        '応援',
        style: TextStyle(fontSize: 11, color: Colors.black),
      ),
    );
  }

  ElevatedButton entryButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.arrow_right),
      label: const Text(
        'Entry',
        style: TextStyle(fontSize: 11, color: Colors.black),
      ),
      // ボタンの色をCyanに設定する
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.cyan, // ボタンの背景色を指定
      ),
    );
  }

  Padding bottomSideContactButton() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: ElevatedButton.icon(
        onPressed: () {
          // ボタンが押されたときの処理
        },
        icon: const Icon(Icons.arrow_right),
        label: const Text(
          'まずは話を聞きにいく',
          style: TextStyle(fontSize: 11, color: Colors.black),
        ),
        // ボタンの色設定
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan, // 背景色をCyanに設定
        ),
      ),
    );
  }
}
