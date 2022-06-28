import 'dart:convert';
import 'dart:io';

import 'package:bloc_demo/model/pincode_model.dart';
import 'package:http/http.dart' as http;

Future<PincodeModel> getPincodes() async {
  try {
    final resp = await http.get(
      Uri.parse(
          'http://demo.elanadudaily.ociuzerp.in/mobileapi/getPincodes?CityID=1'),
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final pokeResp = PincodeModel.fromMap(decoded);
      return pokeResp;
    } else {
      throw Exception('Failed to load list');
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
