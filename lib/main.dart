import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_maker/abstract/abstract.dart';
import 'package:foodie_maker/models/models.dart';
import 'package:foodie_maker/routes.dart';
import 'package:redux/redux.dart';
import 'redux/reducer/app_state_reducer.dart';
import 'redux/action/actions.dart';

Future<void> main({
  IngredientRepositoryAbs ingredientRepository,
  RecipeRepositoryAbs recipeRepository,
}) async {
  runApp(FludieApp(
    ingredientRepository: ingredientRepository,
    recipeRepository: recipeRepository,
  ));
}

class FludieApp extends StatelessWidget {
  final Store<AppState> store;

  FludieApp({
    Key key,
    @required IngredientRepositoryAbs ingredientRepository,
    @required RecipeRepositoryAbs recipeRepository,
  })  : store = Store<AppState>(
          appReducer,
          initialState: AppState.loading(),
          distinct: true,
          middleware: [],
        ),
        super(key: key) {
    store.dispatch(InitAppAction());
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreConnector<AppState, AppState>(
        converter: (Store store) => store.state,
        builder: (BuildContext context, AppState appState) => MaterialApp(
              title: "Foofie Maker",
              routes: getRoutes(context, store),
              onGenerateRoute: (r) => getGenerateRoute(r, context, store),
            ),
      ),
    );
  }
}
