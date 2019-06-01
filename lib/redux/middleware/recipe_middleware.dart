import 'package:foodie_maker/abstract/abstract.dart';
import 'package:foodie_maker/abstract/ingredient_repository_abs.dart';
import 'package:foodie_maker/models/models.dart';
import 'package:foodie_maker/redux/action/recipe_actions.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createRecipeMiddleware(
  RecipeRepositoryAbs repository,
) {
  return [
    TypedMiddleware<AppState, FindRecipeRequest>(
      _handleFind(repository),
    ),
  ];
}

void Function(
  Store<AppState> store,
  FindRecipeRequest action,
  NextDispatcher next,
) _handleFind(
  RecipeRepositoryAbs repository,
) {
  return (store, action, next) {
    repository.findRecipe(action.title).listen((List<Recipe> recipes) {
      store.dispatch(FindRecipeResponse(recipes));
    });
  };
}
