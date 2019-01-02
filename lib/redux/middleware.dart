import 'dart:async';

import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;

import '../model/app_state.dart';
import 'actions.dart';
import 'package:music_manager/service/api_fetcher.dart';

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
        .then((state) => store.dispatch(LoadAlbumsAction(state.albums)));
  };
}


Future<AppState> loadFromAPI(tag) async {
  getTopAlbums(tag)
      .then((http.Response response){
        print(response.body);
      });

  return AppState.initialState();
}