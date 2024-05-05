import 'package:fakerecruit/model/RecruitInfo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecruitItem extends StatelessWidget {
  const RecruitItem({
    super.key,
    required this.recruitInfo,
  });

  final RecruitInfo recruitInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 18,
      ),
      // containerごとメソッドに返すほうが管理はしやすいかも
      child: Container(
        // padding: const EdgeInsets.symmetric(
        //   // ← 内側の余白を指定
        //   horizontal: 20,
        //   vertical: 16,
        // ),
        height: 370,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            color: const Color(0xFFFFFFFF), // ← 背景色を指定
            borderRadius: const BorderRadius.all(
              // ← 角丸を設定
              Radius.circular(32),
            ),
//color: 影の色の指定
// offset: オフセット、影の位置の指定
// offset のデフォルト値は、Offset(0, 0)※Widgetと影が、同じ位置で重なっている
// blurRadius: 影のぼかし具合を調節
// spreadRadius:影の広がり具合を調節
            boxShadow: [
              // メソッドで要素を呼ぶことも可能
              personalSettingShadow(),
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            // 特定位置のみにBorderRadiusをつける。
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32), // 左上の角を丸くする
              topRight: Radius.circular(32), // 右上の角を丸くする
            ),
            child: Image.asset(
              height: 230,
              width: double.infinity, // 親要素の幅いっぱいに設置
              imgPathById(recruitInfo.id),
              fit: BoxFit.fill,
            ),
          ),
          // テキストを表示

          const Text(
            '株式会社XXXX', // 表示したいテキスト
            style: TextStyle(
              fontSize: 18, // テキストのフォントサイズ
              fontWeight: FontWeight.bold, // テキストのフォントウェイト
            ),
          ),
          Text(
            recruitInfo.needsTitle, // 表示したいテキスト
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            recruitInfo.workContext, // 表示したいテキスト
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            "${DateFormat('yyyy/MM/dd').format(recruitInfo.createdAt).toString()}に募集開始", // 表示したいテキスト
            style: const TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.right,
          ),
        ]),
      ),
    );
  }

  // 募集データのIDが偶数のときは画像を変える
  String imgPathById(int id) {
    var result = "lib/assets/image/engineer.jpeg";
    // 偶数のときは画像を違うものにする
    if (id % 2 == 0) {
      result = "lib/assets/image/LGTM.png";
    }
    return result;
  }



  BoxShadow personalSettingShadow() {
    return const BoxShadow(
      color: Colors.grey,
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(1, 1),
    );
  }
}
