import 'package:foodie_maker/models/models.dart';

class FindRecipeRequest{
  final String title;

  FindRecipeRequest(this.title);
}
class FindRecipeResponse{
  final List<Recipe> recipes;

  FindRecipeResponse(this.recipes);
}