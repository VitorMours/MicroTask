import "package:drift/drift.dart";
import "package:sqflite/sqflite.dart";

class AppConfigModel extends Table{



  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min:3, max:25)();
  TextColumn get description => text()();
  BoolColumn get done => boolean()();
  DateTimeColumn get createdAt => dateTime().nullable()();

}


// @DriftDatabase(tables: [AppConfigModel])
// class AppDatabase extends _$AppDatabase {



// }