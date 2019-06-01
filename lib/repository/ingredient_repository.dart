import 'package:foodie_maker/abstract/ingredient_repository_abs.dart';
import 'package:foodie_maker/models/ingredient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class IngredientRepository implements IngredientRepositoryAbs {
  IngredientRepository({@required this.firestore});

  final Firestore firestore;

  @override
  Stream<List<Ingredient>> findIngredients(String title) {
    return firestore.collection("ingredients").snapshots().map((snapshot) =>
        snapshot.documents
            .map((DocumentSnapshot doc) => Ingredient.fromSnapshot(doc))
            .toList());
  }
}
