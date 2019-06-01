import 'package:flutter/material.dart';

class ListHorizontalFood extends StatelessWidget {
  final List<Widget> cards = new List.generate(5, (i) => new CardProyects());
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100,
      constraints: BoxConstraints(minHeight: 130),
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 8),
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: cards,
      ),
    );
  }
}

class CardProyects extends StatefulWidget {
  @override
  _CardProyectsState createState() => _CardProyectsState();
}

class _CardProyectsState extends State<CardProyects>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _controller.forward();
    super.initState();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final _theme = Theme.of(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, widget) => Transform.translate(
            transformHitTests: false,
            offset:
                Offset.lerp(Offset(200.0, 0.0), Offset.zero, _controller.value),
            child: widget,
          ),
      child: Container(
          margin: EdgeInsets.only(right: 16, bottom: 8),
        child: InkWell(
          onTap: (){},
          child: Stack(
            overflow: Overflow.clip,
            fit: StackFit.loose,
            children: <Widget>[
              Positioned(
                top: -0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Colors.orange.withOpacity(0.06),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: -5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 60,
                    width: 60,
                    color: Colors.orange.withOpacity(0.06),
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(minWidth: 80),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Text(
                        'Vegatales',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
