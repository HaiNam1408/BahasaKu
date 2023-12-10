class Question {
  final String text;
  final String image;
  final List<Answer> answersList;

  Question(this.text, this.answersList, {this.image = ''});
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(Question(
      "What does the picture mean?",
      [
        Answer("Hair", false),
        Answer("Shoulder", false),
        Answer("Nose", true),
        Answer("Mounth", false),
      ],
      image: 'assets/images/IlustrationTestPageSuccess.png'));
  list.add(Question(
    "These address should be listed in ____ order.",
    [
      Answer("alphabet", true),
      Answer("alphabetize", false),
      Answer("alphabetically", false),
      Answer("alphabetical", true),
    ],
  ));
  list.add(Question(
    "Employees dislike tasks that are ____.",
    [
      Answer("repeat", false),
      Answer("repetitive", true),
      Answer("repetition", false),
      Answer("repetitively", false),
    ],
  ));
  list.add(Question(
    "Mr.Nodle called to cancel his ____",
    [
      Answer("notebook", false),
      Answer("calender", false),
      Answer("Appointment", true),
      Answer("notice", false),
    ],
  ));
  list.add(Question(
    "The last train to Hamburg ____ at 10:30.",
    [
      Answer("depart", false),
      Answer("departs", true),
      Answer("to depart", false),
      Answer("departing", false),
    ],
  ));
  list.add(Question(
    "Is the annual report ____ yet?",
    [
      Answer("avail", false),
      Answer("available", true),
      Answer("availability", false),
      Answer("availing", false),
    ],
  ));

  return list;
}
