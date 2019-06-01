import 'package:foodie_maker/models/models.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<Ingredient> ingredients;
  final List<Recipe> recipes;
  AppState({
    this.isLoading = false,
    this.ingredients = const [],
    this.recipes = const [],
  });

  factory AppState.loading() => new AppState(isLoading: true);

  @override
  int get hashCode =>
      isLoading.hashCode ^ ingredients.hashCode ^ recipes.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          ingredients == other.ingredients &&
          recipes == other.recipes;

  @override
  String toString() =>
      'AppState{isLoading: $isLoading, ingredients: $ingredients, recipes: $recipes}';
}
