import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class Recipe {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  Recipe({
    @required String id,
    @required String title,
    @required String imageUrl,
    @required String description,
  })  : id = id ?? "___id",
        title = title ?? "",
        imageUrl = imageUrl ?? "",
        description = description ?? "";

  static Recipe fromJson(Map<dynamic, dynamic> json, DocumentReference ref) {
    return Recipe(
        id: ref.documentID,
        title: json["title"],
        imageUrl: json["image_url"],
        description: json["description"]);
  }

  static Recipe fromSnapshot(DocumentSnapshot snapshot) =>
      fromJson(snapshot.data, snapshot.reference);
}
