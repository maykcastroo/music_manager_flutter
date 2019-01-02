import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:redux/redux.dart';


import 'actions.dart';
import 'package:music_manager/service/api_fetcher.dart' as fetcher;
import 'package:music_manager/model/album.dart';
import 'package:music_manager/model/app_state.dart';

List<Middleware<AppState>> appStateMiddleware([
  AppState state = const AppState(albums: []),
]) {
  final loadAlbums = _loadFromAPI(state);

  return [
    TypedMiddleware<AppState, GetAlbumsAction> (loadAlbums),
  ];
}

Middleware<AppState> _loadFromAPI(AppState state){
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    loadFromAPI(action.tag)
        .then((state) => store.dispatch(LoadAlbumsAction(List.unmodifiable(state.albums))));
  };
}


Future<AppState> loadFromAPI(tag) async {
  List<Album> albumsList = [];
  await fetcher.getTopAlbums(tag)
      .then((http.Response response){
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> albumsListData = jsonData['albums']['album'];

        albumsListData.forEach((albumInfo){
          albumsList.add(Album(
              id: albumInfo['mbid'],
              name: albumInfo['name'],
              artist: albumInfo['artist']['name'],
              cover: albumInfo['image'][3]['#text'],
              tracks: null
          ));
        });
      });

  if(albumsList != null) {
    return AppState(albums: albumsList);
  }
  else{
    return AppState.initialState();
  }
}