import 'dart:convert';

import 'package:flutter/services.dart';

import '../../screen/home/model/home_model.dart';

class planetJsonHelper
{
  Future<List<PlanetModel>> planetJson() async
  {
    var jsonString = await rootBundle.loadString("assets/json/planet.json");
    List json = jsonDecode(jsonString);
    print(json);

    List<PlanetModel> planetList = json.map((e) => PlanetModel.mapToModel(e)).toList();
    return planetList;
  }
}