import 'package:foodie_maker/abstract/ingredient_repository_abs.dart';
import 'package:foodie_maker/models/models.dart';
import 'package:foodie_maker/redux/action/ingredient_actions.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createIngredientMiddleware(
  IngredientRepositoryAbs repository,
) {
  return [
    TypedMiddleware<AppState, FindIngredientRequest>(
      _handleFind(repository),
    ),
  ];
}

void Function(
  Store<AppState> store,
  FindIngredientRequest action,
  NextDispatcher next,
) _handleFind(
  IngredientRepositoryAbs repository,
) {
  return (store, action, next) {
    repository
        .findIngredients(action.title)
        .listen((List<Ingredient> ingredients) {
      store.dispatch(FindIngredientResponse(ingredients));
    });
  };
}
