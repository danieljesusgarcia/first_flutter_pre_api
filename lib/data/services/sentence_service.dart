import 'package:english_words/english_words.dart';
import 'package:first_flutter/data/models/sentence.dart';

abstract class ISentenceService {
  Sentence getNext();
}

class SentenceService implements ISentenceService {
  @override
  Sentence getNext() {
    return Sentence(text: WordPair.random().asString);
  }
}
