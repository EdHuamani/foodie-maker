import 'package:flutter/material.dart';
import 'package:foodie_maker/presentation/food_create.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  final TextStyle titleFont = TextStyle(
      fontFamily: 'Lobster Two', fontWeight: FontWeight.normal, fontSize: 40);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.blueGrey[100],
                    ),
                  ),
                  child: Stack(
                    overflow: Overflow.clip,
                    fit: StackFit.loose,
                    children: <Widget>[
                      Positioned(
                        top: -5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 30,
                            width: 30,
                            color: Colors.red.withOpacity(0.06),
                          ),
                        ),
                      ),
                      Positioned(
                        right: -5,
                        bottom: -5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 40,
                            width: 40,
                            color: Colors.blue.withOpacity(0.06),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Text('Vegatales'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Lista',
                    style: titleFont,
                  ),
                  Text(
                    'tus ingredientes:',
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.cyan,
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.cyan.withOpacity(0.5),
                        blurRadius: 10.0,
                      ),
                    ]),
                child: FlatButton(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Maker',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodCreate()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
