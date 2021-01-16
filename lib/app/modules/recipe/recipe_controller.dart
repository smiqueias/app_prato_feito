import 'package:app_recipes_managment/app/data/repositories/recipe_repository.dart';

class RecipeController {

  final _repositpry = RecipeRepository();

  static final INSTANCE = RecipeController();

  Future<List<Map<String,dynamic>>> fetchRecipes() async {
    return _repositpry.getRecipeList();
  }

  Future<List<Map<String,dynamic>>> fetchRecipeIngredients({int id}) async {
    return _repositpry.getRecipeIngredients(id: id);
  }

}