import 'package:chilis/Pages/menu.dart';
import 'package:flutter/material.dart';

class SplitScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(

        children: [
        //  Spacer(),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: ClipOval(
                child: Container(
                  height: 150,
                  width: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/3ac2b39ad528f8c8c5dc77c59abb683d.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),



          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chilis Tunisie',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'Découvrez les meilleures recettes syriennes',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                    ),
                  ),

                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text(
                      'Voir notre menu',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
         // Spacer(),
        ],
      ),
    );
  }
}
