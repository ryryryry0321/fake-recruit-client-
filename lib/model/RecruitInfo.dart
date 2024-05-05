
// TODO 画像URLは固定で持つ、表示側の制御のみでもよいか
class RecruitInfo{

  const RecruitInfo({
    required this.id, 
    required this.needsTitle, 
    required this.workContext, 
    required this.createdAt
  });

  final int id;
  final String needsTitle;
  final String workContext;
  final DateTime createdAt;

  // JSONからオブジェクトを生成
  factory RecruitInfo.makeObjFromJson(dynamic json){
    return RecruitInfo(
      id: json["id"] as int,
      needsTitle: json["needs_title"] as String,
      workContext: json["work_context"] as String,
      createdAt: DateTime.parse(json["created_at"] as String),
    );
  }

}