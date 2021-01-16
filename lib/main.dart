import 'package:app_recipes_managment/app/global/constants/app_constants.dart';
import 'package:app_recipes_managment/app/modules/new_recipe/new_recipe_view.dart';
import 'package:flutter/material.dart';

import 'app/modules/recipe/recipe_view.dart';
import 'app/theme/app_theme.dart';

main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recipe Management",
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: INITIAL_ROUTE,
      routes: {
        INITIAL_ROUTE : (_) => RecipeView(),
        NEW_RECIPE : (_) => NewRecipeView(),
      },
    );
  }
}
