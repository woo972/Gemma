import 'dart:io';
import 'package:gemma/model/ProfileModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DbProvider {
  // singleton pattern
  DbProvider._();
  static final DbProvider dbProviderInstance = DbProvider._();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDb();
    return _database;
  }

  _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "com.k.w.gemma.db");

    //debug
    // await deleteDatabase(path);    

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE GEMMA_PROFILE ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name TEXT NOT NULL,"
          "sex INTEGER,"
          "age INTEGER,"
          "type_code INTEGER,"
          "default_flag INTEGER"
          ")");
    });
  }

  /*
   * [Profile]
   */
  Future<int> saveProfile(ProfileModel p) async {
    final db = await database;
    return await db.rawInsert(
        "insert into gemma_profile"
        "(name, sex, age, default_flag)"
        "values (?,?,?,?)",
        [p.name, p.sex, p.age, p.defaultFlag]);
  }

  Future<int> isProfileExsist() async {
    final db = await database;
    return Sqflite.firstIntValue(
        await db.rawQuery("select count(*) from gemma_profile where default_flag = 1"));
  }

  Future<ProfileModel> getDefaultProfile() async {
    final db = await database;
    var rslt = await db.rawQuery("select id, name, sex, age, type_code, default_flag"
        " from gemma_profile"
        " where default_flag = 1");
    return ProfileModel(
        id: rslt.first['id'],
        name: rslt.first['name'],        
        sex: rslt.first['sex'],        
        age: rslt.first['age'],        
        defaultFlag: rslt.first['default_flag'],        
        typeCode: rslt.first['type_code']);
  }

  Future<List<ProfileModel>> getProfileList() async {
    final db = await database;
    var rslt = await db.rawQuery("select id, name, default_flag"
        " from gemma_profile"
        " order by default_flag desc, id asc");
    return List.generate(rslt.length, (idx) {
      return ProfileModel(
        id: rslt[idx]["id"],
        name: rslt[idx]["name"],
        defaultFlag: rslt[idx]["default_flag"]
      );
    });
  }

  Future<ProfileModel> getProfileById(int id) async {
    final db = await database;
    var rslt =
        await db.rawQuery("select * from gemma_profile where id=?", [id]);
    return ProfileModel(
      id: rslt.first["id"],
      name: rslt.first["name"],
      sex: rslt.first["sex"],
      age: rslt.first["age"],
      defaultFlag: rslt.first["default_flag"],
      typeCode: rslt.first["type_code"],
    );
  }

  Future<void> updateProfile(ProfileModel p) async {
    final db = await database;
    await db.rawUpdate(
        "update gemma_profile set name=?, sex=?,"
        "age=?, default_flag=?, type_code=?"
        "where id=?",
        [
          p.name,
          p.sex,
          p.age,
          p.defaultFlag,
          p.typeCode,
          p.id
        ]);
  }

  Future<void> initializeDefaultFlag() async {
    final db = await database;
    await db.rawUpdate("update gemma_profile set default_flag=0");
  }

  Future<void> removeProfileById(int id) async {
    final db = await database;
    await db.rawDelete("delete from gemma_profile where id = ?", [id]);
  }

  Future<void> removeAllProfile() async {
    final db = await database;
    await db.rawDelete("delete from gemma_profile");
  }

  // /*
  //  * [Diagnosis]
  //  */
  // Future<int> saveDiagnosticResult(ProfileModel p) async {
  //   final db = await database;
  //   return await db.rawUpdate(
  //       "update gemma_profile"
  //       "set typeCode = ?"
  //       "where id = ?",
  //       [p.typeCode, p.id]);
  // }
}
