import 'package:dishes/app.dart';
import 'package:dishes/data/dish.dart';
import 'package:dishes/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Dishes extends StatelessWidget {
  static List<Dish> _dishes = [Dish(' ', '', 'kebab.jpg')];
  static DBHelper db;

  @override
  Widget build(BuildContext context) {
    _dishes = [Dish(' ', '', 'kebab.jpg')];
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     db = DBHelper.dbHelper;
      //     Dish dish1 = Dish(
      //       'Kebab',
      //       "The kebab has a long heritage (the name was first recorded as far "
      //           "back as the 14th century) and is thought to have originated "
      //           "in Turkey with soldiers cooking their freshly hunted meat "
      //           "over open fires. Kebabs come in a multitude of varieties, "
      //           "from the popular shish and döner to regional specialities "
      //           "like Adana and testi. Traditionally, only lamb is used, "
      //           "however, as tastes have evolved so has the variety of meats.",
      //       'kebab.jpg',
      //     );
      //     Dish dish2 = Dish(
      //       'Hamburger',
      //       "The hamburger has its roots in Germany and is named after the "
      //           "city of Hamburg where, during the 19th century, local beef "
      //           "was ground and mixed with onions and garlic and then formed "
      //           "into patties. But the dish we know and love today is no doubt "
      //           "an American icon. The modern incarnation is attributed to "
      //           "several Americans and is an essential part of US food culture.",
      //       'hamburger.jpg',
      //     );
      //     Dish dish3 = Dish(
      //       'Khachapuri',
      //       "These doughy vessels – carrying cheese, butter and a runny egg in "
      //           "the centre – are as Georgian as it gets. The country's "
      //           "national dish, it's great as a sharing starter or as a side "
      //           "as part of a bigger meal. In Georgia, khachapuri is such a "
      //           "popular, widely available dish that it's even used to measure "
      //           "inflation levels in different Georgian cities (this is known "
      //           "as the Khachapuri Index).",
      //       'khachapuri.jpg',
      //     );
      //     Dish dish4 = Dish(
      //       'Fish and chips',
      //       "When you’ve found the perfect cosy pub or enjoyed a long stroll "
      //           "on a blustery British beach, nothing else will do. The dish "
      //           "has a foggy origin story, with potential 19th-century roots "
      //           "in both Lancashire and London – indeed, chips were a cheap, "
      //           "tasty, staple food in the industrial north and fried fish was "
      //           "common in London’s East End. Whatever the truth, battered "
      //           "white fish married with the perfect chip is a national "
      //           "passion that has never abated.",
      //       'fish_and_chips.jpg',
      //     );
      //     // db.insert(dish1);
      //     // db.insert(dish2);
      //     db.insert(dish3);
      //     db.insert(dish4);
      //   },
      // ),
      body: FutureBuilder<List<Dish>>(
        initialData: [_dishes[0]],
        future: _getDishes(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Container(
                height: 275,
                child: Stack(
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/' + snapshot.data[index].image,
                      ),
                      onTap: () {
                        _navigateToDish(context, snapshot.data[index]);
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 100,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              _dishes[index].name.toString().toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontFamily: 'piedra',
                                letterSpacing: 10,
                              ),
                            ),
                            Text(
                              _dishes[index].recipe,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'chilanka',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<Dish>> _getDishes() async {
    db = DBHelper.dbHelper;
    _dishes = await db.getDishes();
    print(_dishes.length);
    return _dishes;
  }

  _navigateToDish(BuildContext context, Dish dish) {
    Navigator.pushNamed(
      context,
      App.appRouteDish,
      arguments: {'dish': dish},
    );
  }
}
