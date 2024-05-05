// ignore_for_file: slash_for_doc_comments

import 'dart:convert';

import 'package:fakerecruit/model/RecruitInfo.dart';
import 'package:http/http.dart' as http;

/**
 * 自作のExpress APIに接続
 */
class APIConnector {
  /**
   * keywordをクエリとしてAPIに検索リクエストを送る
   * 
   * @param keyword APIのクエリに送る募集の検索ワード
   */
  Future<List<RecruitInfo>> search(String keyword) async {

    // Uri.httpはこの書き方で/path?q=hogeになる
    final uri =
        Uri.http("localhost:3000", "/api/v1/match", {"keyword": keyword});
    // Expressで作成したRestAPIへリクエスト
    final http.Response res = await http.get(uri);

    if (res.statusCode == 200) {
      final List<dynamic> body = jsonDecode(res.body);
      return body.map((json) => RecruitInfo.makeObjFromJson(json)).toList();
    } else {
      return [];
    }
  }
}
