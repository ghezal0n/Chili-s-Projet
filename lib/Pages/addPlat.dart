import 'dart:io' if (dart.library.html) 'dart:typed_data' show Uint8List;
import 'dart:io' show File;
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPlatPage extends StatefulWidget {
  @override
  _AddPlatPageState createState() => _AddPlatPageState();
}

class _AddPlatPageState extends State<AddPlatPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prixController = TextEditingController();
  dynamic _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (kIsWeb) {
        setState(() {
          _image = pickedFile.path;
        });
      } else {
        final File imageFile = File(pickedFile.path);
        final Uint8List bytes = await imageFile.readAsBytes();

        setState(() {
          _image = bytes;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Plat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nomController,
                decoration: InputDecoration(labelText: 'Nom du Plat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du plat';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _prixController,
                decoration: InputDecoration(labelText: 'Prix'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le prix du plat';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Choisir une Image'),
              ),
              SizedBox(height: 10.0),
              _image != null
                  ? kIsWeb
                  ? Image.network(
                _image,
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              )
                  : Image.memory(
                _image,
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              )
                  : Container(),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    String nom = _nomController.text;
                    double prix = double.parse(_prixController.text);

                    Plat nouveauPlat = Plat(
                      nom: nom,
                      prix: prix,
                      image: _image,
                    );

                    Navigator.pop(context, nouveauPlat);
                  }
                },
                child: Text('Ajouter Plat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Plat {
  final String nom;
  final double prix;
  final dynamic image;

  Plat({
    required this.nom,
    required this.prix,
    required this.image,
  });
}
