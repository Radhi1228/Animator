import 'package:animation_app/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/helper/json_helper.dart';
import '../../../utils/helper/shared_helper.dart';

class HomeProvider with ChangeNotifier
{

  bool theme = false;
  bool isTheme = false;
  ThemeMode mode = ThemeMode.dark;
  bool isOn = true;
  IconData themeMode = Icons.dark_mode;
  List<String> imageList = [];
  List<String> nameList = [];
  ShareHelper shareHelper = ShareHelper();

  Future<void> setBookMark(String name1, String pImg) async {

    List<String> name = await shareHelper.getNameList();
    List<String> img = await shareHelper.getImageList();

    name.add(name1);
    img.add(pImg);

    shareHelper.setNameList(name);
    shareHelper.setImageList(img);

    notifyListeners();
  }
  Future<void> removeBookMark(String name1, String pImg) async {

    List<String> name = await shareHelper.getNameList();
    List<String> img = await shareHelper.getImageList();

    name.remove(name1);
    img.remove(pImg);

    shareHelper.setNameList(name);
    shareHelper.setImageList(img);

    getBookMark();

    notifyListeners();
  }

  Future<void> getBookMark() async {
    nameList = (await shareHelper.getNameList());
    imageList = (await shareHelper.getImageList());
    notifyListeners();

  }


  void setThemeData() async {
    theme = !theme;
    setData(isTheme: theme);
    isTheme = (await getData1())!;
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    }
    notifyListeners();
  }
  void changeTheme() {
    isOn = !isOn;
    notifyListeners();
  }

  void getThemeData() async {
    if (await getData1() == null) {
      isTheme = false;
    } else {
      isTheme = (await getData1())!;
    }
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    } else {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    }
    notifyListeners();
  }
  List<PlanetModel> planetList = [];
  void getPlanet()async
  {
    planetJsonHelper helper = planetJsonHelper();
    planetList= await helper.planetJson();
    print(planetList);
    notifyListeners();
  }
}