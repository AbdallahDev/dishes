import 'package:dishes/db/db_helper.dart';

class Dish {
  int _id;
  String _name;
  String _recipe;
  String _image;

  Dish(this._name, this._recipe, this._image);

  Dish.fromMap(Map map) {
    _id = map[DBHelper.ID_COLUMN];
    _name = map[DBHelper.NAME_COLUMN];
    _recipe = map[DBHelper.RECIPE_COLUMN];
    _image = map[DBHelper.IMAGE_COLUMN];
  }

  set id(value) => _id = value;

  get id => _id;

  set name(value) => _name = value;

  get name => _name;

  set recipe(value) => _recipe = value;

  get recipe => _recipe;

  set image(value) => _image = value;

  get image => _image;

  toMap() {
    var map = Map();
    map[DBHelper.NAME_COLUMN] = _name;
    map[DBHelper.RECIPE_COLUMN] = _recipe;
    map[DBHelper.IMAGE_COLUMN] = _image;
    return map;
  }
}