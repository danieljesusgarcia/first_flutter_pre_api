import 'dart:convert';
import 'dart:io';

import 'package:english_words/english_words.dart';
import 'package:first_flutter/data/models/sentence.dart';
import 'package:http/http.dart' as http;

abstract class ISentenceService {
  Future<Sentence> getNext();
}

class SentenceService implements ISentenceService {
  @override
  Future<Sentence> getNext() async {

    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if(response.statusCode == 200){
      return Sentence.fromJson(jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load album');
    }
    
    //return Sentence(text: WordPair.random().asString);
  }
}
