import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/Covid19tracker/model/world_states_model.dart';

import 'appuri.dart';

class WorldStatesViewModel {


  Future<WorldStatesModel> fetchWorldRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

Future<List<dynamic>> fetchcountries() async{
var data;
final response = await http.get(Uri.parse(AppUrl.countriesList));

if (response.statusCode==200) {
  data = jsonDecode(response.body);
  return data;
}
else
{
  throw Exception('Error');
}


} 


}