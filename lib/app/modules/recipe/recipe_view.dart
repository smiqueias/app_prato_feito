import 'package:app_recipes_managment/app/global/constants/app_constants.dart';
import 'package:flutter/material.dart';

import 'components/recipe_list_tile.dart';

class RecipeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

          IconButton(
            icon: Icon(
              Icons.add_to_photos,
              color: Colors.blue,
            ),

            onPressed: () => Navigator.pushNamed(context, Constants.NEW_RECIPE),

          )

        ],
        centerTitle: false,
        title: Text(
          'All Recipes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
        ),
      ),

      body: RecipeListTile()

    );
  }
}
