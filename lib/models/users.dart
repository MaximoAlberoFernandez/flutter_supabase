// import 'dart:convert';

// import 'package:supabase_flutter/supabase_flutter.dart';

// class User {
//   String id;
//   String name;
//   String email;

//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//   });

//   factory User.fromJson(Map<String, dynamic> map) {
//     return User(
//       id: map['id'] as String,
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//     );
//   }
// }

// class UsersModel {
//   final SupabaseClient _client;

//   UsersModel(this._client);

//   Future<User?> getCurrentUser() async {
//     try {
//       final AuthUser? authUser = _client.auth.currentUser;
//       if (authUser != null) {
//         final response = await _client.from('users').select().eq('id', authUser.id).execute();
//         final List<Map<String, dynamic>> data = response.data as List<Map<String, dynamic>>;
//         if (data.isNotEmpty) {
//           return User.fromJson(data[0]);
//         }
//       }
//       return null;
//     } catch (error) {
//       // Handle errors as needed
//       print('Error getting current user: $error');
//       return null;
//     }
//   }
// }
