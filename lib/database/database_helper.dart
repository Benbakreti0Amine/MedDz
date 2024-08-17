
import 'dart:convert';

import 'package:Meddz/core/api/end_ponits.dart';
import 'package:Meddz/models/doctor/get_doctor_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'doctors.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

 Future _onCreate(Database db, int version) async {
  await db.execute('''
    CREATE TABLE doctors (
      ${ApiKey.id} INTEGER PRIMARY KEY,
      ${ApiKey.name} TEXT,
      ${ApiKey.lastname} TEXT,
      ${ApiKey.profilePicture} TEXT, 
      ${ApiKey.degree} TEXT,
      ${ApiKey.specialization} TEXT,
      ${ApiKey.beginOfWork} TEXT,
      ${ApiKey.experienceYears} INTEGER,
      ${ApiKey.rating} REAL,
      ${ApiKey.reviewsCount} INTEGER,
      ${ApiKey.availableDays} TEXT,
      ${ApiKey.availableHours} TEXT,
      ${ApiKey.bio} TEXT,
      ${ApiKey.highlights} TEXT
    )
  ''');
}

  // Insert doctor
  // Future<void> insertDoctor(GetDoctorModel doctor) async {
  //   final db = await database;
  //   await db.insert('doctors', doctor.toJson(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }
  Future<void> insertDoctor(GetDoctorModel doctor) async {
  final db = await database;
  final doctorJson = {
    ApiKey.id: doctor.id,
    ApiKey.name: doctor.name,
    ApiKey.lastname: doctor.lastname,
    ApiKey.profilePicture: doctor.profilePicture,
    ApiKey.degree: doctor.degree,
    ApiKey.specialization: doctor.specialization,
    ApiKey.beginOfWork: doctor.beginOfWork,
    ApiKey.experienceYears: doctor.experienceYears,
    ApiKey.rating: doctor.rating,
    ApiKey.reviewsCount: doctor.reviewsCount,
    ApiKey.availableDays: doctor.availableDays != null 
        ? jsonEncode(doctor.availableDays) 
        : null,
    ApiKey.availableHours: doctor.availableHours != null 
        ? jsonEncode(doctor.availableHours) 
        : null,
    ApiKey.bio: doctor.bio,
    ApiKey.highlights: doctor.highlights,
  };
  await db.insert('doctors', doctorJson,
      conflictAlgorithm: ConflictAlgorithm.replace);
}


  // // Get all doctors
  // Future<List<GetDoctorModel>> getDoctors() async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> maps = await db.query('doctors');

  //   // Debug print to inspect the fetched data
  //   for (var map in maps) {
  //     print('Fetched doctor data: $map');
  //   }
  //   print('2222222222222222222222222222222222222222222222222222');

  //   print(maps.map((map) => GetDoctorModel.fromJson(map)).toList());
  //   // Directly map the fetched data to GetDoctorModel
  //   return maps.map((map) => GetDoctorModel.fromJson(map)).toList();
  // }
 Future<List<GetDoctorModel>> getDoctors() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('doctors');

  // Convert JSON strings to maps
  final doctors = maps.map((map) {
    final availableDays = map[ApiKey.availableDays] != null 
        ? Map<String, String>.from(jsonDecode(map[ApiKey.availableDays]))
        : null;
    final availableHours = map[ApiKey.availableHours] != null 
        ? Map<String, String>.from(jsonDecode(map[ApiKey.availableHours]))
        : null;

    return GetDoctorModel(
      id: map[ApiKey.id],
      name: map[ApiKey.name],
      lastname: map[ApiKey.lastname],
      profilePicture: map[ApiKey.profilePicture],
      degree: map[ApiKey.degree],
      specialization: map[ApiKey.specialization],
      beginOfWork: map[ApiKey.beginOfWork],
      experienceYears: map[ApiKey.experienceYears],
      rating: map[ApiKey.rating],
      reviewsCount: map[ApiKey.reviewsCount],
      availableDays: availableDays,
      availableHours: availableHours,
      bio: map[ApiKey.bio],
      highlights: map[ApiKey.highlights],
    );
  }).toList();

  return doctors;
}

  Future<void> printAllDoctors() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('doctors');

    print('=============================');
    print('All doctors in the database:');
    maps.forEach((doctor) {
      print(doctor);
      print('333333333333333333333333333333');
    });
    print('=============================');
  }

  Future<void> clearAllDoctors() async {
    final db = await database;
    await db.delete('doctors'); // Deletes all records from the 'doctors' table
  }

  Future<void> deleteDatabaseFile() async {
    String path = join(await getDatabasesPath(), 'doctors.db');
    await deleteDatabase(path);  
  }

  Future<void> recreateDatabase() async {
    await deleteDatabaseFile(); // Correct method name
    _database = await _initDatabase();  
  }
}
