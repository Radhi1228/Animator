import 'package:shared_preferences/shared_preferences.dart';

void setData({required bool isTheme}) async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.setBool("theme", isTheme);
}

Future<bool?> getData1() async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  return shr.getBool("theme");
}
class ShareHelper {
  Future<void> setImageList(List<String> image) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList('image', image);
  }
  Future<void> setNameList(List<String> name) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList('name', name);
  }

  Future<List<String>> getNameList() async {
    SharedPreferences shr= await SharedPreferences.getInstance();
    List<String>name= shr.getStringList("name")??[];
    return name;
  }
  Future<List<String>> getImageList() async {
    SharedPreferences shr= await SharedPreferences.getInstance();
    List<String>image= shr.getStringList("image")??[];
    return image;
  }
}