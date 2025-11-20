// lib/presentation/viewmodels/sentence_vm.dart
import 'dart:collection';

import 'package:flutter/material.dart';

import '../../data/models/sentence.dart';
import '../../data/repositories/sentence_repository.dart';

class SentenceVM extends ChangeNotifier {
  final ISentenceRepository _sentenceRepository;

  SentenceVM({
    required ISentenceRepository sentenceRepository,
  }) : _sentenceRepository = sentenceRepository {
    _current = _sentenceRepository.current;
  }

  // Internal State
  late Sentence _current;

  // Getters
  Sentence get current => _current;
  UnmodifiableListView<Sentence> get history => UnmodifiableListView(_sentenceRepository.history);
  UnmodifiableListView<Sentence> get favorites => UnmodifiableListView(_sentenceRepository.favorites);

  Future<void> next() async {
    _current = await _sentenceRepository.getNext();
    notifyListeners();
  }

  void toggleFavorite(Sentence sentence) {
    _sentenceRepository.toggleFavorite(sentence);
    notifyListeners();
  }

  bool isFavorite(Sentence pair) {
    return _sentenceRepository.isFavorite(pair);
  }

  void toggleCurrentFavorite() {
    toggleFavorite(_current);
    notifyListeners();
  }

  //  Future<void> toggleFavorite(Sentence m, bool isFav) async {
  //    if (isFav) {
  //      //await _favorites.remove(m.id);
  //    } else {
  //      //await _favorites.add(m);
  //    }
  //  }

  //Stream<List<Sentence>> watchFavorites() => _favorites.watchAll();
}
