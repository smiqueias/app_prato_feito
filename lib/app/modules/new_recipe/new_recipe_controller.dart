import 'package:mobx/mobx.dart';
part 'new_recipe_controller.g.dart';

class NewRecipeController = _NewRecipeController with _$NewRecipeController;

abstract class _NewRecipeController with Store {

  @observable
  int x = 0;

  @action
  increment() => x++;

  @action
  incrementD() => x--;

}