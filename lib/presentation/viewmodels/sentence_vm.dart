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
    _favorites = _sentenceRepository.favorites;
    _history = _sentenceRepository.history;
    _current = _sentenceRepository.current;
  }

  // Internal State
  late Sentence _current;
  List<Sentence> _history = [];
  List<Sentence> _favorites = [];

  // Getters
  Sentence get current => _current;
  UnmodifiableListView<Sentence> get history => UnmodifiableListView(_history);
  UnmodifiableListView<Sentence> get favorites => UnmodifiableListView(_favorites);

  void next(){
    _current = _sentenceRepository.getNext();
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
