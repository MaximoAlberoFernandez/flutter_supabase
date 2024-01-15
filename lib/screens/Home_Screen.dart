import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_supabase/screens/Add_City_Screen.dart';
import 'package:flutter_supabase/screens/Login_Screen.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _citiesStream =
      Supabase.instance.client.from('cities').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              // Realiza la funcionalidad de cerrar sesión
              await Supabase.instance.client.auth.signOut();
              // Navega a la pantalla de inicio de sesión o donde prefieras
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _citiesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final cities = snapshot.data!;

          // Obtiene el ID del usuario actual
          final userId = Supabase.instance.client.auth.currentUser?.id;

          // Filtra las ciudades por el ID del usuario actual
          final userCities =
              cities.where((city) => city['created_by'] == userId).toList();

          return ListView.builder(
            itemCount: userCities.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userCities[index]['name']),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCityScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
