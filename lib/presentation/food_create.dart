import 'package:flutter/material.dart';
import 'package:foodie_maker/presentation/list_horizontal_food.dart';

class FoodCreate extends StatelessWidget {
  static String routeName = "/create";
  final TextStyle titleFont = TextStyle(
      fontFamily: 'Lobster Two', fontWeight: FontWeight.normal, fontSize: 40);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Colors.lightGreen,
              ),
              color: Colors.transparent,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Tus deliciosos',
                        style: titleFont,
                      ),
                      Text(
                        'platillos creados',
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            ListHorizontalFood(),
          ],
        ),
      ),
    );
  }
}
