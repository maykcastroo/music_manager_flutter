import '../model/album.dart';

class GetAlbumsAction {
  final String tag;

  GetAlbumsAction(this.tag);
}

class LoadAlbumsAction {
  final List<Album> albums;

  LoadAlbumsAction(this.albums);
}