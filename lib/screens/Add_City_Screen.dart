import 'package:flutter/material.dart';
import 'package:flutter_supabase/screens/Home_Screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddCityScreen extends StatefulWidget {
  const AddCityScreen({Key? key}) : super(key: key);

  @override
  _AddCityScreenState createState() => _AddCityScreenState();
}

class _AddCityScreenState extends State<AddCityScreen> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Afegeix una ciutat'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final cityName = nameController.text;
                final user = Supabase.instance.client.auth.currentUser;

                // Inserta el valor en la tabla "cities"
                //final response =
                 await Supabase.instance.client
                    .from('cities')
                    .insert({'name': cityName, 'created_by': user!.id});

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );

              },
              child: Text('Afegir'),
            ),
          ],
        ),
      ),
    );
  }
}
