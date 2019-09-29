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
   * [Profile] insert
   */
  Future<int> saveProfile(ProfileModel profile) async {
    final db = await database;
    Map<String,dynamic> p = profile.toMap();
    return await db.rawInsert(
        "insert into gemma_profile"
        "(name, sex, age, default_flag)"
        "values (?,?,?,?)",
        [p['name'], p['sex'], p['age'], p['default_flag']]);
  }

  /*
   * [Profile] select
   */
  Future<int> isProfileExsist() async {
    final db = await database;
    return Sqflite.firstIntValue(
        await db.rawQuery("select count(*) from gemma_profile where default_flag = 1"));
  }

  Future<ProfileModel> getDefaultProfile() async {
    final db = await database;
    List<Map> rslt = await db.rawQuery("select id, name, sex, age, type_code, default_flag"
        " from gemma_profile"
        " where default_flag = 1");
    return ProfileModel.fromMap(rslt.first);
  }

  Future<List<ProfileModel>> getProfileList() async {
    final db = await database;
    List<Map> rslt = await db.rawQuery("select id, name, age, sex, default_flag, type_code"
        " from gemma_profile"
        " order by default_flag desc, id asc");
    return List.generate(rslt.length, (idx) {
      return ProfileModel.fromMap(rslt[idx]);
    });
  }

  Future<ProfileModel> getProfileById(int id) async {
    final db = await database;
    List<Map> rslt = await db.rawQuery("select * from gemma_profile where id=?", [id]);
    return ProfileModel.fromMap(rslt.first);
  }

  /*
   * [Profile] update
   */
  Future<void> updateProfile(ProfileModel profile) async {
    final db = await database;
    Map<String,dynamic> p = profile.toMap();
    await db.rawUpdate(
        "update gemma_profile set name=?, sex=?,"
        "age=?, default_flag=?, type_code=?"
        "where id=?",
        [p['name'], p['sex'], p['age'], p['default_flag'], p['type_code'], p['id']]);

  }

  Future<void> initializeDefaultFlag() async {
    final db = await database;
    await db.rawUpdate("update gemma_profile set default_flag=0");
  }

  /*
   * [Profile] delete
   */

  Future<void> removeProfileById(int id) async {
    final db = await database;
    await db.rawDelete("delete from gemma_profile where id = ?", [id]);
  }

  Future<void> removeAllProfile() async {
    final db = await database;
    await db.rawDelete("delete from gemma_profile");
  }
}
