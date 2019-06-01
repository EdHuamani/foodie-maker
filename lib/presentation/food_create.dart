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
            Container(
              constraints: BoxConstraints(minHeight: 120),
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    blurRadius: 9.0,
                    offset: Offset(0.0, 5.0),
                  ),
                ],
              ),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 8),
                        Text(
                          'Titulo de la comida',
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'description',
                          style: Theme.of(context).textTheme.body1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          height: 2,
                          width: 18,
                          color: Colors.cyan,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              size: 15,
                            ),
                            Container(width: 8.0),
                            Text(
                              '30` min',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
