import 'package:foodie_maker/models/models.dart';

abstract class RecipeRepositoryAbs {
  Stream<List<Recipe>> findRecipe(String id);
}
