import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              children: [
                Text(
                  'Notre Menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8.0),
                  height: 2.0,
                  color: Colors.red,
                ),
                SizedBox(height: 16),
                _buildMenuSection('Nos Fajitas'),
                SizedBox(height: 16),
                _buildGridView(),
              ],
            ),
            SizedBox(height: 16),
            Column(
              children: [
                _buildMenuSection('Autres Plats'),
                SizedBox(height: 16),
                _buildGridView(),
              ],
            ),

            // Formulaire de contact
            SizedBox(height: 16),
            _buildContactForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(String sectionTitle) {
    return Row(
      children: [
        Text(
          sectionTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        String itemName = 'Plat ${index + 1}';
        double itemPrice = 49.90;
        String imagePath = 'assets/images/food_image_$index.png';

        return GestureDetector(
          onTap: () {
            // Action à effectuer lorsque l'élément est pressé
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagePath,
                  height: 90,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Text(
                itemName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Text(
                '$itemPrice DT',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactForm() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background1.png',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Formulaire de Contact',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      TextField(
                        decoration: InputDecoration(labelText: 'Nom et Prénom'),
                      ),
                      SizedBox(height: 5.0),
                      TextField(
                        decoration: InputDecoration(labelText: 'Adresse Email',
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),),

                      ),
                      SizedBox(height: 5.0),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Votre message ici...',
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Action à effectuer lorsqu'on appuie sur le bouton "Envoyer"
                        },
                        child: Text('Envoyer'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Image.asset(
                  'assets/images/370050781_365784705793991_4793002467210721526_n.png',
                  height: 80,
                  width: 80,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



}

  void main() {
  runApp(MaterialApp(
    home: MenuPage(),
  ));
}
