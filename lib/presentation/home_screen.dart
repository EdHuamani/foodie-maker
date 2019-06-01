import 'package:flutter/material.dart';
import 'package:foodie_maker/presentation/ingredient_detect_screen.dart';
import 'package:camera/camera.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'package:foodie_maker/containers/recipes_filtered.dart';


class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  final TextStyle titleFont = TextStyle(
      fontFamily: 'Lobster Two', fontWeight: FontWeight.normal, fontSize: 40);

  void _navigate(context) {
    Navigator.pushNamed(context, RecipesFiltered.routeName);
  }


  void _navigateToIngredientDetect(context) async {
    List<CameraDescription>  cameras = await availableCameras();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IngredientDetectScreen(cameras)),
    );
  }


  List getItems(context) {
    return [
      rowFilterByType(),
      buildTitle(context),
      SizedBox(height: 16),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: ListTile(
          title: Text("Papa"),
          trailing: Icon(Icons.remove),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: ListTile(
          title: Text("pollo"),
          trailing: Icon(Icons.remove),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: mockup only
    List items = getItems(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
          padding: EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.3,
                child: Container(
                  margin: EdgeInsets.only(right: 30),
                  child: FlareActor("assets/animation/loading.flr",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: "loading"),
                ),
              ),
              ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return items[index];
                },
              ),
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        icon: Icon(Icons.search),
        onPressed: () => _navigate(context),
        label: Text("Maker"),
        backgroundColor: Colors.cyan,
      ),
    );
  }

  Widget rowFilterByType() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
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
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text('Vegatales'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTitle(context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              'Lista',
              style: titleFont,
            ),
          ),
          Text(
            'tus ingredientes:',
            style: Theme.of(context)
                .textTheme
                .display1
                .copyWith(color: Colors.black),
          ),
          RaisedButton(
            onPressed: () =>  _navigateToIngredientDetect(context) ,
            child: Text("Camera"),
             ),
        ],
      ),
    );
  }
}
