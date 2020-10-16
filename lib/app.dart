import 'package:dishes/screens/dish_details.dart';
import 'package:dishes/screens/dishes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  static const String appRoute = '/';
  static const String appRouteDish = '/dish';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _generateRoute(),
      home: Dishes(),
    );
  }

  RouteFactory _generateRoute() {
    return (RouteSettings settings) {
      Map arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case appRouteDish:
          screen = DishDetails(dish: arguments['dish']);
          break;
        default:
          break;
      }
      return MaterialPageRoute(
        builder: (BuildContext context) => screen,
      );
    };
  }
}
