import 'package:coffe_app/core/database/boxes_names.dart';
import 'package:coffe_app/core/enum/boxes_type.dart';
import 'package:coffe_app/main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveDB {
  Future initDB() async {
    final documents = await getApplicationDocumentsDirectory();
    Hive.init(documents.path);
    await Hive.initFlutter();
    await Hive.openBox(BoxesNames.settings);
  }

  Future putData({
    required String boxName,
    required String key,
    required dynamic value,
    required BoxType boxType,
  }) async {
    Box box = Hive.box(boxName);
    box.put(key, value);
  }

  dynamic getData({
    required String boxName,
    required String key,
    required dynamic defaultValue,
    required boxType,
  }) {
    dynamic data;
    Box box = Hive.box(boxName);
    data = box.get(key, defaultValue: defaultValue);
    return data;
  }

  Future clearData({
    required String boxName,
    required BoxType boxType,
  }) async {
    Box box = Hive.box(boxName);
    await box.clear();
  }

  Future claerAllData() async {
    hiveDB.claerAllData();
  }
}
