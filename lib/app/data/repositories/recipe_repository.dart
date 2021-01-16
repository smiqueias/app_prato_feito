import 'package:app_recipes_managment/app/data/interfaces/recipe_interface.dart';
import 'package:app_recipes_managment/app/global/constants/app_constants.dart';
import 'package:hasura_connect/hasura_connect.dart';

class RecipeRepository implements IRecipe {

  HasuraConnect _client = HasuraConnect(HASURA_CONNECT_URL);

  @override
  Future<List<Map<String,dynamic>>> getRecipeList() async {
    final response = await _client.query('''
     query  {
        recipes{
          id
          name
          image_url
          description
        }
      }
    ''');


    return (response['data']['recipes'] as List)
        .map((recipe) => {
          'id' : recipe['id'],
          'name' : recipe['name'],
          'image_url' : recipe['image_url'],
          'description' : recipe['description']
        })
        .toList();
  }

  @override
   Future<List<Map<String, dynamic>>> getRecipeIngredients({int id}) async {

    final response = await _client.query('''
      query {
        ingredients(
          where: {
            recipe_id: {
              _eq: $id
            }
          }
        ) {
          name
        }
      }
    ''');

    return (response['data']['ingredients'] as List )
        .map((ingredient) => {
        'id' : ingredient['id'],
        'name' : ingredient['name']
      }).toList();


  }



}