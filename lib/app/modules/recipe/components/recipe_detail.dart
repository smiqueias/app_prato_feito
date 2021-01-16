import 'package:app_recipes_managment/app/modules/recipe/recipe_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {

  var recipe;
  int index;

  final _controller = RecipeController.INSTANCE;

  RecipeDetail({this.recipe, this.index});


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    final recipeId = recipe[index]['id'];
    
    return Container(
      height: size.height,
      width: double.infinity,
      child: AlertDialog(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            recipe[index]['name'],
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    recipe[index]['image_url'],
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.03,),

              Text(
                recipe[index]['description'],
                style: TextStyle(
                  fontSize: 18
                ),
              ),

              SizedBox(height: size.height * 0.03,),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ingredientes',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              SizedBox(height: size.height * .02 ,),

              Container(
                height: size.height * .4,
                width: double.maxFinite,
                child: FutureBuilder(
                  future: _controller.fetchRecipeIngredients(id: recipeId),
                  builder: (context, snapshot) {

                    final recipeList = snapshot.data;

                    if (snapshot.hasError) print(snapshot.error);

                    else if (snapshot.connectionState != ConnectionState.done) {
                      return Align(
                        alignment: Alignment.topCenter,
                        child: CircularProgressIndicator(),
                      );
                    }

                    return Scrollbar(
                      child: ListView.builder(
                        itemCount: recipeList.length,
                        itemBuilder: (ctx,index) {

                          return Card(
                            color: Colors.blue[400],
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                recipeList[index]['name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          );

                        },
                      ),
                    );


                  },
                ),
              )

            ],
          ),
        ),

        actions: [

          Padding(
            padding: const EdgeInsets.all(4),
            child: RaisedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Voltar'
              ),
            ),
          )

        ],

      ),
    );
  }

}
