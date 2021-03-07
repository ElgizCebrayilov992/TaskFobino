import 'dart:convert';

import 'package:fonibotask/color/color_generator.dart';
import 'package:fonibotask/models/note.dart';
import 'package:http/http.dart' as http;

class JsonService {
  Future<List<Note>> getJsonPlaceHolderData() async {
    //  listPost = [];
    final _response =
        await http.get("https://cdn.fonibo.com/challenges/tasks.json");

    return (jsonDecode(_response.body) as List)
        .map((jsonDatas) =>
            Note.fromJsonMap(jsonDatas, ColorGenerator().randomCcolors()))
        .toList();
  }
}
