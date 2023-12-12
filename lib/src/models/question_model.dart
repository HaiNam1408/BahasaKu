class Question {
  String? type;
  String? title;
  String? image;
  String? sentence;
  List<String>? choices;
  String? answer;

  Question(
      {this.type,
      this.title,
      this.image,
      this.sentence,
      this.choices,
      this.answer});

  Question.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    image = json['image'];
    sentence = json['sentence'];
    choices = json['choices']?.cast<String>();
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    data['image'] = this.image;
    data['sentence'] = this.sentence;
    data['choices'] = this.choices;
    data['answer'] = this.answer;
    return data;
  }
}
