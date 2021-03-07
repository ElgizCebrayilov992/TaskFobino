import 'package:flutter/material.dart';

class Note {
  int id;
  String title;
  String createdAt;
  final Color color;

  Note.fromJsonMap(Map<String, dynamic> map, Color color)
      : id = map["id"],
        title = map["title"],
        createdAt = map["createdAt"],
        this.color = color;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['createdAt'] = createdAt;
    return data;
  }
}
