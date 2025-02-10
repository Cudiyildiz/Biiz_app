class Section {
  String title;
  List<Lesson> lessons;

  Section({required this.title, required this.lessons});
}

class Lesson {
  String title;
  String videoUrl;

  Lesson({required this.title, required this.videoUrl});
}
