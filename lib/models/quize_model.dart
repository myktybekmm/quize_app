class QuizeModel {
  QuizeModel({required this.title, required this.isCorrect});

  final String title;
  final bool isCorrect;
}

List<QuizeModel> quections = [
  QuizeModel(title: "Kыргызстандаын борбор шаары Бишкек?", isCorrect: true),
  QuizeModel(title: "Oзгон баткенге карайт?", isCorrect: false),
  QuizeModel(title: "Американын борбору Вашингтон?", isCorrect: true),
  QuizeModel(title: "Kрым орустардыкы?", isCorrect: false),
];
