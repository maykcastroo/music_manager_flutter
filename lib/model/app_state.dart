import 'package:flutter/foundation.dart';

import 'album.dart';

class AppState {
  final List<Album> albums;

  const AppState({
    @required this.albums,
  });

  AppState.initialState() : albums = List.unmodifiable(<Album>[]);

  AppState.fromJson(Map json)
      : albums = (json['albums'] as List).map((i) => Album.fromJson(i)).toList();

  Map toJson() => {'albums': albums};

  @override
  String toString() {
    return toJson().toString();
  }
}