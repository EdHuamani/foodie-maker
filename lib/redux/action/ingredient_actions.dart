import 'package:foodie_maker/models/models.dart';

class FindIngredientRequest {
  final String title;

  FindIngredientRequest(this.title);
}

class FindIngredientResponse {
  final List<Ingredient> ingredients;

  FindIngredientResponse(this.ingredients);
}
