import 'package:flutter/foundation.dart';

class Track {
  final int rank;
  final String name;
  final int duration;
  final bool favorite;

  Track({
    @required this.rank,
    @required this.name,
    @required this.duration,
    this.favorite = false,
  });

  Track.fromJson(Map json)
    : rank = json['rank'],
      name = json['name'],
      favorite = json['favorite'],
      duration = json['duration'];

  Map toJson() => {
    'rank': (rank as int),
    'name': name,
    'duration': (duration as int),
    'favorite': (favorite as bool),
  };

  @override
  String ToString(){
    return toJson().toString();
  }
}