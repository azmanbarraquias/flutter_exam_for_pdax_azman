import 'dart:ffi';
import 'dart:isolate';
import 'package:flutter_exam_for_pdax_azman/models/images.dart';
import 'package:flutter_exam_for_pdax_azman/models/persons.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  final baseURL = "https://fakerapi.it/api/v2";

  Future<Images?> getImages({int quantity = 20}) async {
    var client = http.Client();

    var uri = Uri.parse('$baseURL/images?$quantity');
    var respond = await client.get(uri);
    if (respond.statusCode == 200) {
      var json = respond.body;
      return imagesFromJson(json);
    }
    return null;
  }

  Future<Persons?> getPersons({int quantity = 20}) async {
    var client = http.Client();

    var uri = Uri.parse('$baseURL/persons?$quantity');
    var respond = await client.get(uri);
    if (respond.statusCode == 200) {
      var json = respond.body;
      return personsFromJson(json);
    }
    return null;
  }
}
