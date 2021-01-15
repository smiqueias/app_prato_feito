import 'package:flutter/material.dart';

class NewRecipeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Recipe'
        ),
      ),
    );
  }
}
