import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Databasehelper {
  static final Databasehelper _instance = Databasehelper._internal();
  static Database? _database;

  factory Databasehelper(){
    return _instance;
  }
  Databasehelper._internal();

}