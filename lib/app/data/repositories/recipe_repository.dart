import 'package:app_recipes_managment/app/data/interfaces/recipe_interface.dart';
import 'package:app_recipes_managment/app/global/constants/app_constants.dart';
import 'package:hasura_connect/hasura_connect.dart';

class RecipeRepository implements IRecipe {

  final _client = HasuraConnect(Constants.HASURA_CONNECT_URL);

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
          'name' : recipe['name'],
          'image_url' : recipe['image_url'],
          'description' : recipe['description']
        })
        .toList();
  }



}