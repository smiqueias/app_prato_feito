// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_recipe_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewRecipeController on _NewRecipeController, Store {
  final _$xAtom = Atom(name: '_NewRecipeController.x');

  @override
  int get x {
    _$xAtom.reportRead();
    return super.x;
  }

  @override
  set x(int value) {
    _$xAtom.reportWrite(value, super.x, () {
      super.x = value;
    });
  }

  final _$_NewRecipeControllerActionController =
      ActionController(name: '_NewRecipeController');

  @override
  dynamic increment() {
    final _$actionInfo = _$_NewRecipeControllerActionController.startAction(
        name: '_NewRecipeController.increment');
    try {
      return super.increment();
    } finally {
      _$_NewRecipeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementD() {
    final _$actionInfo = _$_NewRecipeControllerActionController.startAction(
        name: '_NewRecipeController.incrementD');
    try {
      return super.incrementD();
    } finally {
      _$_NewRecipeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
x: ${x}
    ''';
  }
}
