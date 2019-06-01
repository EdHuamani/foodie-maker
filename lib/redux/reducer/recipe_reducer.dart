import 'package:foodie_maker/models/models.dart';
import 'package:foodie_maker/redux/action/recipe_actions.dart';
import 'package:redux/redux.dart';

final recipeReducer = combineReducers<List<Recipe>>([
  new TypedReducer<List<Recipe>, FindRecipeResponse>(_search),
]);

List<Recipe> _search(List<Recipe> user, FindRecipeResponse action) {
  return action.recipes;
}
