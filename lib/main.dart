import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:music_manager/model/album.dart';
import 'package:music_manager/model/app_state.dart';
import 'package:music_manager/redux/reducers.dart';
import 'package:music_manager/redux/actions.dart';
import 'package:music_manager/redux/middleware.dart';

import 'ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: appStateMiddleware(),
    );

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Music Manager',
        home: StoreBuilder<AppState>(
          onInit: (store) => store.dispatch(GetAlbumsAction('pop')),
          builder: (BuildContext context, Store<AppState> store) => Home(),
        )
      ),
    );
  }
}