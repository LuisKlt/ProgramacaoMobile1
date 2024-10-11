import 'package:bdflutter/DatabaseHelper.dart';
import 'package:bdflutter/Pessoa.dart';
import 'package:sqflite/sqflite.dart';

class PessoaDAO {
  final Databasehelper _dbhelper = Databasehelper();

  Future<void> insertPessoa(Pessoa pessoa) async{
    final db = await _dbhelper.database;
    await db.insert('pessoa', pessoa.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updatePessoa(Pessoa pessoa) async{
    final db = await _dbhelper.database;
    await db.update('pessoa', pessoa.toMap(), where: 'id = ?', whereArgs: [pessoa.id]); 
  }

  Future<void> deletePessoa(Pessoa pessoa) async{
    final db = await _dbhelper.database;
    await db.delete('pessoa', where: 'id = ?', whereArgs: [pessoa.id]);
  }

  Future<List<Pessoa>> selectPessoas() async{
    final db = await _dbhelper.database;
    final List<Map<String, dynamic>> tipoJSON = await db.query('pessoa');
    return List.generate(tipoJSON.length, (i){
      return Pessoa.fromMap(tipoJSON[i]);
    });
  }

}