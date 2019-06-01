import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_maker/models/models.dart';
import 'package:foodie_maker/presentation/recipe_screen.dart';
import 'package:foodie_maker/redux/action/recipe_actions.dart';
import 'package:redux/redux.dart';

class RecipesFiltered extends StatelessWidget {
  static String routeName = "/recipes";
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return RecipeScreen(
          recipes: vm.recipes,
          onLoad: vm.onLoad,
        );
      },
    );
  }
}

class _ViewModel {
  _ViewModel({@required this.recipes, @required this.onLoad});

  final List<Recipe> recipes;
  final VoidCallback onLoad;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        recipes: store.state.recipes,
        onLoad: () {
          store.dispatch(FindRecipeRequest(""));
        });
  }
}
