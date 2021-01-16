import 'package:flutter/material.dart';

class NewRecipeBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return Container(
    height: size.height,
    width: size.width,

    child: Form(
      child: Column(

        children: [

          _buildFormInput(text: "Nome"),
          _buildFormInput(text: "Descrição")

        ],

      ),
    ),
  );
  }
}

 Widget _buildFormInput({
    String text,
  }) {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: TextFormField(
          maxLines: text == "Descrição" ? 7 : null,
          decoration: InputDecoration(
              labelText: text,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              alignLabelWithHint: true,
              labelStyle: TextStyle(
                  color: Colors.grey,
               ),
               disabledBorder: InputBorder.none,
               enabledBorder: InputBorder.none,
               border: InputBorder.none,
           ),
         ),
      ),
    ),
  );
}
