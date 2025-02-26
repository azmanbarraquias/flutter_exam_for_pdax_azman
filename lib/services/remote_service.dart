import 'package:flutter_exam_for_pdax_azman/models/persons.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  final String baseURL = "https://fakerapi.it/api/v2";

  Future<Persons?> getPersons({int quantity = 10, int page = 1}) async {
    var client = http.Client();

    var uri = Uri.parse('$baseURL/persons?_quantity=$quantity&_page=$page');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return personsFromJson(json);
    }
    return null;
  }
}
