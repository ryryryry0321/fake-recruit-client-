// ignore_for_file: slash_for_doc_comments

import 'dart:convert';

import 'package:fakerecruit/model/RecruitInfo.dart';
import 'package:http/http.dart' as http;

/**
 * 自作のExpress APIに接続
 */
class APIConnector {
  /**
   * idベースでAPIに検索リクエストを送る
   * 
   * @param id 募集ID
   * @return 募集情報単体
   */
  Future<RecruitInfo> findById(int id) async {
    final uri = Uri.http("localhost:3000", "/api/v1/recruit/$id");
    final http.Response res = await http.get(uri);

    if (res.statusCode == 200) {
      final dynamic resBody = jsonDecode(res.body); // jsonデコードしないとレスポンスの型を正常に扱えない(intとか)
      print(resBody);
      return RecruitInfo.makeObjFromJson(resBody);
    } else {
      throw Exception(
          "Failed to request to API. Http-status-code: ${res.statusCode}");
    }
  }

  /**
   * keywordをクエリとしてAPIに検索リクエストを送る
   * 
   * @param keyword APIのクエリに送る募集の検索ワード
   * @return 募集情報のリスト
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
