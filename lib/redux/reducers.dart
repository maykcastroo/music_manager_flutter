import '../model/album.dart';
import '../model/app_state.dart';
import 'actions.dart';

import 'package:redux/redux.dart';

AppState appStateReducer(AppState state, action){
  return AppState(
    albums: albumReducer(state.albums, action),
  );
}

Reducer<List<Album>> albumReducer = combineReducers<List<Album>>([
  TypedReducer<List<Album>, LoadAlbumsAction> (loadAlbumsReducer),
]);

List<Album> loadAlbumsReducer(List<Album> albums, LoadAlbumsAction action) {
  return action.albums;
}