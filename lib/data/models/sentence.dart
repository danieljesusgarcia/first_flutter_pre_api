class Sentence {
  // Constructor
  Sentence({required this.text});

  // Atributs
  String text;

  // Mètodes
  void myMethod() {
    // Implementació del mètode
  }

  factory Sentence.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'title': String title} => Sentence(text: title,),
      _ => throw const FormatException('Failed to load Sentence'),
    };
  }
}