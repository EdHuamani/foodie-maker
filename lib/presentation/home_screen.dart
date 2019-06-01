import 'package:flutter/material.dart';
import 'package:foodie_maker/presentation/food_create.dart';
import 'package:foodie_maker/presentation/ingredient_detect_screen.dart';
import 'package:camera/camera.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  final TextStyle titleFont = TextStyle(
      fontFamily: 'Lobster Two', fontWeight: FontWeight.normal, fontSize: 40);

  void _navigate(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FoodCreate()),
    );
  }

  void _navigateToIngredientDetect(context) async {
    List<CameraDescription>  cameras = await availableCameras();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IngredientDetectScreen(cameras)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List items = [
      rowFilterByType(),
      buildTitle(context),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return items[index];
          },
        ),
      ),
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
          RaisedButton(
            onPressed: () =>  _navigateToIngredientDetect(context) ,
            child: Text("Camera"),
             ),
        ],
      ),
    );
  }
}
