import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:bloc_demo/model/model.dart';

Future<ModelClass> fetchList() async {
  try {
    final resp = await http.get(
      Uri.parse(
          'http://demo.elanadudaily.ociuzerp.in/mobileApi/getfeaturedlist?Userid=135&CityID=1'),
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final pokeResp = ModelClass.fromMap(decoded);
      return pokeResp;
    } else {
      throw Exception('Failed to load pokemon list');
    }
  } on SocketException {
    throw Exception('Server error');
  } on HttpException {
    throw Exception('Something went wrong');
  } on FormatException {
    throw Exception('Bad request');
  } catch (e) {
    throw Exception(e.toString());
  }
}
