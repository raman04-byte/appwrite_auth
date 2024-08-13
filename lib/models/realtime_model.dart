class RealtimeModel {
  String text1;
  String text2;

  RealtimeModel({
    required this.text1,
    required this.text2,
  });

  factory RealtimeModel.fromJson(Map<String, dynamic> json) {
    return RealtimeModel(
      text1: json['text1'],
      text2: json['text2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text1': text1,
      'text2': text2,
    };
  }
}
