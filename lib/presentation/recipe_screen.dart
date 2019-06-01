import 'package:flutter/material.dart';
import 'package:foodie_maker/models/models.dart';
import 'package:foodie_maker/presentation/list_horizontal_food.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key key, @required this.recipes, @required this.onLoad})
      : super(key: key);
  final List<Recipe> recipes;
  final VoidCallback onLoad;

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final TextStyle titleFont = TextStyle(
      fontFamily: 'Lobster Two', fontWeight: FontWeight.normal, fontSize: 40);

  @override
  void initState() {
    super.initState();
    widget.onLoad();
  }

  @override
  Widget build(BuildContext context) {
    List items = getITems();
    items.addAll(widget.recipes);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.withOpacity(0.2),
        elevation: 0,
        title: Container(
          child: Image.asset('assets/img/logo.png'),
        ),
        centerTitle: true,
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
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            var item = items[index];
            if (item is Container ||
                item is SizedBox ||
                item is ListHorizontalFood) return item;

            return buildCard(item);
          },
        ),
      ),
    );
  }

  List getITems() {
    return [
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Tus deliciosos',
                    style: titleFont,
                  ),
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
    ];
  }

  Widget buildCard(Recipe recipe) {
    return Container(
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
              padding: EdgeInsets.all(4),
              child: Image.network(recipe.imageUrl),
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 8),
                  Text(
                    recipe.title,
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
            ),
          ],
        ),
      ),
    );
  }
}
