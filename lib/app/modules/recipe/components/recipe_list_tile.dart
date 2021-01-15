import 'package:app_recipes_managment/app/modules/recipe/recipe_controller.dart';
import 'package:flutter/material.dart';

class RecipeListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    final _controller = RecipeController.INSTANCE;

    return FutureBuilder(
      future: _controller.fetchRecipes(),
      builder:  (context, snapshot) {

        final recipeList = snapshot.data;

        if (snapshot.hasError) {
          throw Exception(
            'Erro inesperado'
          );
        }

        else if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: AlertDialog(
              elevation: 1,
              title: const Text(
                  'Carregando'
              ),
              content: Container(
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            ),
          );
        }

        return Column(
        children: [
          TextButton(
            onPressed: () {

              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  color: Colors.white,
                  child: const Text('Recipe Detail'),
                )
              );

            },
            child: Container(
              child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: recipeList.length,
                    itemBuilder: (context,index) {

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            recipeList[index]['image_url']
                                        )
                                    )
                                ),
                              ),

                              SizedBox(width: size.width * 0.05,),

                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    Text(
                                      recipeList[index]['name'],
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),

                                    SizedBox(height: size.height * 0.02,),

                                    Text(
                                      recipeList[index]['description'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.blueGrey
                                      ),
                                    ),
                                  ],
                                ),

                              )],

                          ),
                        ),
                      );
                    },
                  ),
              ),
            ),
          ]
          );
      }
  );
  }
}
