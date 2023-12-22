class Course {
  String? id;
  String? title;
  String? subtitle;
  String? image;
  List<String>? coverImage;
  String? description;
  String? participants;
  List<Content>? content;

  Course(
      {this.id,
      this.title,
      this.subtitle,
      this.image,
      this.coverImage,
      this.description,
      this.participants,
      this.content});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    image = json['image'];
    coverImage = json['cover_image'].cast<String>();
    description = json['description'];
    participants = json['participants'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['image'] = this.image;
    data['cover_image'] = this.coverImage;
    data['description'] = this.description;
    data['participants'] = this.participants;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? lesson;
  String? title;
  String? estimate;
  List<String>? setOfQuestion;

  Content({this.lesson, this.title, this.estimate, this.setOfQuestion});

  Content.fromJson(Map<String, dynamic> json) {
    lesson = json['lesson'];
    title = json['title'];
    estimate = json['estimate'];
    setOfQuestion = json['set_of_question'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lesson'] = this.lesson;
    data['title'] = this.title;
    data['estimate'] = this.estimate;
    data['set_of_question'] = this.setOfQuestion;
    return data;
  }
}
