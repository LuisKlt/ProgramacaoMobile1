import 'package:sqflite/sqflite.dart';
import 'package:viagemcalculo/DatabaseHelper.dart';
import 'package:viagemcalculo/model/carros.dart';

class CarrosDAO {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> insertCarro(Carros carros) async {
    final db = await _dbHelper.database;
    await db.insert('carros', carros.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateCarro(Carros carros) async {
    final db = await _dbHelper.database;
    await db.update('carros', carros.toMap(),
        where: 'id = ?', whereArgs: [carros.id]);
  }

  Future<void> deleteCarro(int index) async {
    final db = await _dbHelper.database;
    await db.delete('carros', where: 'id = ?', whereArgs: [index]);
  }

  Future<List<Carros>> selectCarros() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> tipoJSON = await db.query('carros');
    return List.generate(tipoJSON.length, (i) {
      return Carros.fromMap(tipoJSON[i]);
    });
  }

}