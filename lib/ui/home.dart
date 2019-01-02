import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:music_manager/model/app_state.dart';
import 'package:music_manager/model/album.dart';


class Home extends StatelessWidget {
  final Store<AppState> store;

  Home(this.store);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Manager"),
        backgroundColor: Colors.purple,
      ),
      body: StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel viewModel) =>
            Column(
              children: <Widget>[
                Expanded(child: AlbumsListWidget(viewModel)),
              ],
            ),
      )
    );
  }
}

class AlbumsListWidget extends StatelessWidget{
  final _ViewModel model;

  AlbumsListWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15.0,
      children: model.albums
          .map((Album album) => Container(
            child: Column(
              children:([
                Card(
                  margin: EdgeInsets.only(bottom: 0.0),
                  child: Image.network(
                      album.cover,
                      width: 150.0,
                    ),
                ),
                Text("Avaliar"),
              ])
            )
          ))
          .toList(),
    );
  }
}

class _ViewModel {
  final List<Album> albums;

  _ViewModel({
    this.albums,
  });

  factory _ViewModel.create(Store<AppState> store){
    return _ViewModel(
      albums: store.state.albums
    );
  }
}