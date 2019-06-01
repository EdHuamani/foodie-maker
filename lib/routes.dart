import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_maker/presentation/home_screen.dart';
import 'package:foodie_maker/presentation/splash_screen.dart';

import 'models/models.dart';

Map<String, WidgetBuilder> getRoutes(context, store) {
  return {
    '/': (BuildContext context) => StoreBuilder<AppState>(
          builder: (context, store) => SplashScreen(),
        ),
    HomeScreen.routeName: (BuildContext context) => new StoreBuilder<AppState>(
          builder: (context, store) => new HomeScreen(),
        ),
  };
}

bool isPathNameWithRoute(RouteSettings settings, String pathName) {
  final List<String> path = settings.name.split('/');
  final List<String> pathScreen = pathName.split('/');
  if (path[0] != '' || pathScreen[0] != '') return false;
  if (path[1].startsWith(pathScreen[1])) {
    if (path.length != 3) return false;
    return true;
  }
  return false;
}

String getIdByPath(RouteSettings settings) {
  final List<String> path = settings.name.split('/');
  if (path[0] != '' || path.length != 3) return null;
  final List<String> id = path[2].split('#');
  return id[0];
}

/// Ejemplo de llamada para un tab en específico:
/// /{routeName}/{id}#{initialTabIndex}
/// example:
///     /food/ID0001#1
int getTabByPath(RouteSettings settings) {
  final List<String> path = settings.name.split('#');
  return path[1] != "null" ? int.parse(path.last) : 0;
}

Route<Null> getGenerateRoute(
    RouteSettings settings, BuildContext context, store) {
  final List<String> path = settings.name.split('/');
  if (path[0] != '') return null;

  
  // // User Badges screen
  // if (isPathNameWithRoute(settings, BadgeDetails.routePath)) {
  //   String _id = getIdByPath(settings);
  //   return new MaterialPageRoute<Null>(
  //     settings: settings,
  //     builder: (BuildContext context) => new StoreBuilder<AppState>(
  //           builder: (context, store) => new BadgeDetails(id: _id),
  //         ),
  //   );
  // }

  // The other paths we support are in the routes table.
  return null;
}
