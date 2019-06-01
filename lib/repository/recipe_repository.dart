import 'package:foodie_maker/abstract/ingredient_repository_abs.dart';
import 'package:foodie_maker/abstract/recipe_repository_abs.dart';
import 'package:foodie_maker/models/ingredient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie_maker/models/recipe.dart';
import 'package:meta/meta.dart';

class RecipeRepository implements RecipeRepositoryAbs {
  RecipeRepository({@required this.firestore});

  final Firestore firestore;

  @override
  Stream<List<Recipe>> findRecipe(String id) {
    return firestore.collection("recipes").snapshots().map((snapshot) =>
        snapshot.documents
            .map((DocumentSnapshot doc) => Recipe.fromSnapshot(doc))
            .toList());
  }
}
