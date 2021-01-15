import 'package:flutter/material.dart';

class NoRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: [

          SizedBox(height: MediaQuery.of(context).size.height * 0.10,),

          Icon(
            Icons.auto_awesome_motion,
            color: Colors.black12,
            size: 50,
          ),

          Text(
            'No recipes to view',
            style: TextStyle(
              color: Colors.grey
            ),
          ),

          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/new'),
            child: Text(
              '+ Add your first'
            ),
          )

        ],

      ),
    );
  }
}
