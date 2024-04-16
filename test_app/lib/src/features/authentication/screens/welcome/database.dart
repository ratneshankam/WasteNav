import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// import 'dart:io';

dynamic database;

// create database
Future<dynamic> createMyDatabase() async {
  
  return openDatabase(
    path.join(await getDatabasesPath(), "UsersDatabase5.db"),
    version: 1,
    onCreate: (db, version) {
      db.execute(''' CREATE TABLE UserData (
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    phone TEXT,
    password TEXT,
    address TEXT
  )
''');
      db.execute(''' CREATE TABLE ReviewData (
    reviewId INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    description TEXT,
    stars REAL
  )
''');
//       db.execute(''' CREATE TABLE AppData (
//     dataId INTEGER PRIMARY KEY,
//     img TEXT,
//     title TEXT,
//     description TEXT,
//     prize INTEGER,
//     stars REAL
//   )
// ''');
      print("Database Created Sucessfully");
    },
  );

}

//insert data into database

Future<void> insertUserData(SingleChildModalUsersData obj) async {
  final localDB = await database;

  localDB.insert(
    "UserData",
    obj.getUserMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// get data from database

Future<List<SingleChildModalUsersData>> fetchUserData() async {
  final localDB = await database;

  List<Map<String, dynamic>> mapEntry = await localDB.query(
    "UserData",
  );
  print("INSIDE MAPENTRY DATA: $mapEntry");
  return List.generate(mapEntry.length, (i) {
    return SingleChildModalUsersData(
        id: mapEntry[i]["id"],
        name: mapEntry[i]["name"],
        email: mapEntry[i]["email"],
        phone: mapEntry[i]["phone"],
        password: mapEntry[i]["password"],
        address: mapEntry[i]["address"],
        );
  });
}
class SingleChildModalUsersData {
  int? id;
  String name;
  String email;
  String phone;
  String password;
  String address;

  SingleChildModalUsersData({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.address,
    this.id,
  });
  Map<String, dynamic> getUserMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "address": address,
    };
  }
}