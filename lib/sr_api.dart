import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Stream<List> apiStream() {
  return new Stream.fromFuture(_apiCall());
}

Future<List> _apiCall() async {
  var uri = new Uri.http("api.sr.se", "/api/v2/programs", {
    "format": "json",
    "size": "40",
    "page": "1",
  });
  return http.get(uri).then((response) {
    return json.decode(response.body)["programs"] ?? new List();
  });
}
