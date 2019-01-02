import 'package:flutter/foundation.dart';

import 'track.dart';

class Album {
  final String id;
  final int rating;
  final String name;
  final String artist;
  final String cover;
  final List<Track> tracks;

  Album({
    @required this.id,
    @required this.name,
    @required this.artist,
    @required this.cover,
    @required this.tracks,
    this.rating = 0,
  });

  Album.fromJson(Map json)
      : rating = json['rating'],
        name = json['name'],
        id = json['favorite'],
        artist = json['duration'],
        tracks = (json['tracks'] as List).map((i) => Track.fromJson(i)).toList(),
        cover = json['cover'];

  Map toJson() => {
    'rating': (rating as int),
    'name': name,
    'id': id,
    'artist': artist,
    'cover': cover,
    'tracks': tracks,
  };

  @override
  String ToString(){
    return toJson().toString();
  }
}