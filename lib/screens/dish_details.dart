import 'package:dishes/data/dish.dart';
import 'package:flutter/material.dart';

class DishDetails extends StatelessWidget {
  final Dish dish;

  DishDetails({this.dish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/' + dish.image),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.name.toString().toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'piedra',
                      letterSpacing: 10,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    dish.recipe,
                    style: TextStyle(
                      fontSize: 27,
                      fontFamily: 'chilanka',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
