class InitModel {
  final int code;
  final String desc;
  final String image;
  final String name;

  InitModel({this.code, this.desc, this.image, this.name});

  factory InitModel.fromJson(Map<String, dynamic> json) {
    return InitModel(
        code: json['code'] as int,
        desc: json['desc'] as String,
        image: json['image'] as String,
        name: json['name'] as String);
  }
}
