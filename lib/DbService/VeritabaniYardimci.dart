
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimci{
  static const  String veritabaniAdi="AnkaDb.db";
  static Future<Database> veriTabaniErisim() async{
    String dataPath = join(await getDatabasesPath(),veritabaniAdi);
    if (!await databaseExists(dataPath)){
      ByteData data =await rootBundle.load("DataBase/${veritabaniAdi}");
      List<int> bytes = data.buffer.asInt8List(data.offsetInBytes,data.lengthInBytes);
      await File(dataPath).writeAsBytes(bytes,flush: true);
    }
    return openDatabase(dataPath);
  }
}