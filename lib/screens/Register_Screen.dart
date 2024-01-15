import 'package:flutter/material.dart';
import 'package:flutter_supabase/screens/Home_Screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

final supabase = Supabase.instance.client;

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: repeatPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Repetir Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final sm = ScaffoldMessenger.of(context);
                if (passwordController.text == repeatPasswordController.text) {
                  try {
                    // Realiza el signUp
                    final authResponse = await supabase.auth.signUp(
                      password: passwordController.text,
                      email: emailController.text,
                    );

                    // Obtiene el usuario recién creado
                    final User? user = authResponse.user;

                    // Guarda datos adicionales en la tabla de 'users'
                    await supabase.from('users').upsert([
                      {
                        'id': user
                            ?.id, // Supongamos que esta es la columna de relación
                        'name': nameController.text,
                        'email': emailController.text,
                        'password': passwordController.text,
                        // Agrega otros campos según sea necesario
                      },
                    ]);

                    sm.showSnackBar(SnackBar(
                      content: Text(
                          "Registered and data saved: ${authResponse.user!.email!}"),
                    ));

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } catch (error) {
                    sm.showSnackBar(SnackBar(
                      content: Text("Error during registration: $error"),
                    ));
                  }
                } else {
                  sm.showSnackBar(SnackBar(
                    content: Text(
                        "Las contraseñas no coinciden. Vuelve a introducirlas."),
                  ));
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
