import 'package:flutter/foundation.dart';

class Album {
  final int id;
  final int rating;
  final String name;
  final String artist;
  final String cover;

  Album({
    @required this.id,
    @required this.name,
    @required this.artist,
    @required this.cover,
    this.rating = 0,
  });

  Album.fromJson(Map json)
      : rating = json['rating'],
        name = json['name'],
        id = json['favorite'],
        artist = json['duration'],
        cover = json['cover'];

  Map toJson() => {
    'rating': (rating as int),
    'name': name,
    'id': (id as int),
    'artist': artist,
    'cover': cover,
  };

  @override
  String ToString(){
    return toJson().toString();
  }
}