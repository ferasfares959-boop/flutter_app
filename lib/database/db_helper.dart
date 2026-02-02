import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  // اسم قاعدة البيانات
  static const String DB_NAME = 'caller_id.db';

  // جدول المستخدمين
  static const String USER_TABLE = 'users';
  static const String CONTACT_TABLE = 'contacts';
  static const String SEARCH_TABLE = 'search_history';

  // إنشاء قاعدة البيانات
  static Future<Database> getDatabase() async {
    if (_db != null) return _db!;

    String path = join(await getDatabasesPath(), DB_NAME);
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // جدول المستخدمين
        await db.execute('''
          CREATE TABLE $USER_TABLE(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            password TEXT
          )
        ''');

        // جدول الأرقام
        await db.execute('''
          CREATE TABLE $CONTACT_TABLE(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            phone TEXT
          )
        ''');

        // جدول سجل البحث
        await db.execute('''
          CREATE TABLE $SEARCH_TABLE(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            phone TEXT,
            date TEXT
          )
        ''');
      },
    );
    return _db!;
  }
}