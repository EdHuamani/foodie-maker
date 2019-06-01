import 'package:foodie_maker/models/models.dart';
import 'package:foodie_maker/redux/reducer/recipe_reducer.dart';
import 'package:foodie_maker/redux/reducer/reducer.dart';

AppState appReducer(AppState state, action) => AppState(
      isLoading: loadingReducer(state.isLoading, action),
      ingredients: ingredientReducer(state.ingredients, action),
      recipes: recipeReducer(state.recipes, action),
    );
