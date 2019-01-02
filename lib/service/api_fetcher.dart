import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:music_manager/model/album.dart';

const ROOT = 'http://ws.audioscrobbler.com/2.0/';
const KEY = 'c795b8ddba51a6eabd06bc03e3bbbe1f';

Future<http.Response> getTopAlbums(String tag) {
  return http.get('${ROOT}?method=tag.gettopalbums&tag=${tag}&api_key=${KEY}&format=json');
}