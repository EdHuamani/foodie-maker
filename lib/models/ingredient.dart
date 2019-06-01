import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class Ingredient {
  final String id;
  final String title;

  Ingredient({
    @required String id,
    @required String title,
  })  : id = id ?? "___id",
        title = title ?? "";

  static Ingredient fromJson(
      Map<dynamic, dynamic> json, DocumentReference ref) {
    return Ingredient(id: ref.documentID, title: json["title"]);
  }

  static Ingredient fromSnapshot(DocumentSnapshot snapshot) =>
      fromJson(snapshot.data, snapshot.reference);
}
