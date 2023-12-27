import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'addPlat.dart';
import 'menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Plat> _plats = [];

  void _supprimerPlat(int index) {
    setState(() {
      _plats.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Menu Page'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuPage()));
              },
            ),
            ListTile(
              title: Text('Option 2'),
              onTap: () {
                // Mettez ici le code pour l'Option 2
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    final nouveauPlat = await Navigator.of(context).push<Plat>(
                      MaterialPageRoute(
                        builder: (context) => AddPlatPage(),
                      ),
                    );

                    if (nouveauPlat != null) {
                      setState(() {
                        _plats.add(nouveauPlat);
                      });
                    }
                  },
                  child: Text('Add Plat'),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: _plats.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        _plats[index].image != null
                            ? kIsWeb
                            ? Image.network(
                          _plats[index].image,
                          height: 70.0,
                          width: 75.0,
                          fit: BoxFit.cover,
                        )
                            : Image.memory(
                          _plats[index].image,
                          height: 70.0,
                          width: 75.0,
                          fit: BoxFit.cover,
                        )
                            : Container(),
                        Text('Nom: ${_plats[index].nom}'),
                        Text('Prix: ${_plats[index].prix}'),
                        ElevatedButton(
                          onPressed: () {
                            _supprimerPlat(index);
                          },
                          child: Text('Supprimer'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
