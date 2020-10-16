import 'package:dishes/data/dish.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  final String DISHES_TABLE = 'dishes';
  static final String ID_COLUMN = 'id';
  static final String NAME_COLUMN = 'name';
  static final String RECIPE_COLUMN = 'recipe';
  static final String IMAGE_COLUMN = 'image';

  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  Database _database;

  Future<Database> get database async {
    if (_database == null) _database = await _createDB();
    return _database;
  }

  Future<Database> _createDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path + 'dishes_db'),
      version: 1,
      onCreate: (Database db, int version) =>
          db.execute('CREATE TABLE $DISHES_TABLE '
              '($ID_COLUMN INTEGER PRIMARY KEY AUTOINCREMENT, '
              '$NAME_COLUMN TEXT, '
              '$RECIPE_COLUMN TEXT, '
              '$IMAGE_COLUMN TEXT)'),
    );
  }

  insert(Dish dish) async {
    Database db = await database;
    db.rawInsert(
        'INSERT INTO $DISHES_TABLE '
        '($NAME_COLUMN, '
        '$RECIPE_COLUMN, '
        '$IMAGE_COLUMN) '
        'VALUES (?, ?, ?)',
        [dish.name, dish.recipe, dish.image]);
  }

  Future<List<Dish>> getDishes() async {
    Database db = await database;
    List<Map<String, dynamic>> list;
    list = await db.query(DISHES_TABLE);
    List<Dish> dishes = List<Dish>();
    list.forEach((map) {
      dishes.add(Dish.fromMap(map));
    });
    return dishes;
  }
}
