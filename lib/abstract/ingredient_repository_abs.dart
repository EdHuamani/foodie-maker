import 'package:foodie_maker/models/models.dart';

abstract class IngredientRepositoryAbs {
  Stream<List<Ingredient>> findIngredients(String title);
}
