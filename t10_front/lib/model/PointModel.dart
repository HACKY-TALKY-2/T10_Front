class PostPoint {
  int? memberKeyId;
  int? addPoint;
  String? type;

  PostPoint({this.memberKeyId, this.addPoint, this.type});

  PostPoint.fromJson(Map<String, dynamic> json) {
    memberKeyId = json['memberKeyId'];
    addPoint = json['addPoint'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberKeyId'] = this.memberKeyId;
    data['addPoint'] = this.addPoint;
    data['type'] = this.type;
    return data;
  }
}
