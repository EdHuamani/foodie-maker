import 'package:foodie_maker/models/models.dart';
import 'package:foodie_maker/redux/action/ingredient_actions.dart';
import 'package:redux/redux.dart';

final ingredientReducer = combineReducers<List<Ingredient>>([
  TypedReducer<List<Ingredient>, FindIngredientResponse>(_search),
  
]);

List<Ingredient> _search(List<Ingredient> user, FindIngredientResponse action) {
  return action.ingredients;
}
