class GetPost {
  bool? result;
  List<Contents>? contents;
  String? message;

  GetPost({this.result, this.contents, this.message});

  GetPost.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['contents'] != null) {
      contents = <Contents>[];
      json['contents'].forEach((v) {
        contents!.add(new Contents.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.contents != null) {
      data['contents'] = this.contents!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Contents {
  String? createDate;
  int? postId;
  int? memberKeyId;
  String? title;
  String? content;
  String? image;
  int? itemPrice;
  String? tradePlace;
  String? kakao;
  int? totalPeople;
  int? participantPeople;
  int? totalItemCount;
  String? location;

  Contents(
      {this.createDate,
      this.postId,
      this.memberKeyId,
      this.title,
      this.content,
      this.image,
      this.itemPrice,
      this.tradePlace,
      this.kakao,
      this.totalPeople,
      this.participantPeople,
      this.totalItemCount,
      this.location});

  Contents.fromJson(Map<String, dynamic> json) {
    createDate = json['createDate'];
    postId = json['postId'];
    memberKeyId = json['memberKeyId'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    itemPrice = json['itemPrice'];
    tradePlace = json['tradePlace'];
    kakao = json['kakao'];
    totalPeople = json['totalPeople'];
    participantPeople = json['participantPeople'];
    totalItemCount = json['totalItemCount'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createDate'] = this.createDate;
    data['postId'] = this.postId;
    data['memberKeyId'] = this.memberKeyId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['itemPrice'] = this.itemPrice;
    data['tradePlace'] = this.tradePlace;
    data['kakao'] = this.kakao;
    data['totalPeople'] = this.totalPeople;
    data['participantPeople'] = this.participantPeople;
    data['totalItemCount'] = this.totalItemCount;
    data['location'] = this.location;
    return data;
  }
}

class PostPost {
  int? memberKeyId;
  String? title;
  String? content;
  int? itemPrice;
  String? tradePlace;
  String? kakao;
  int? totalPeople;
  int? totalItemCount;
  String? location;
  String? multipartFile;

  PostPost(
      {this.memberKeyId,
      this.title,
      this.content,
      this.itemPrice,
      this.tradePlace,
      this.kakao,
      this.totalPeople,
      this.totalItemCount,
      this.location,
      this.multipartFile});

  PostPost.fromJson(Map<String, dynamic> json) {
    memberKeyId = json['memberKeyId'];
    title = json['title'];
    content = json['content'];
    itemPrice = json['itemPrice'];
    tradePlace = json['tradePlace'];
    kakao = json['kakao'];
    totalPeople = json['totalPeople'];
    totalItemCount = json['totalItemCount'];
    location = json['location'];
    multipartFile = json['multipartFile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberKeyId'] = this.memberKeyId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['itemPrice'] = this.itemPrice;
    data['tradePlace'] = this.tradePlace;
    data['kakao'] = this.kakao;
    data['totalPeople'] = this.totalPeople;
    data['totalItemCount'] = this.totalItemCount;
    data['location'] = this.location;
    data['multipartFile'] = this.multipartFile;
    return data;
  }
}

class JoinPost {
  int? postId;
  int? buyCount;
  int? memberKeyId;

  JoinPost({this.postId, this.buyCount, this.memberKeyId});

  JoinPost.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    buyCount = json['buyCount'];
    memberKeyId = json['memberKeyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['buyCount'] = this.buyCount;
    data['memberKeyId'] = this.memberKeyId;
    return data;
  }
}
