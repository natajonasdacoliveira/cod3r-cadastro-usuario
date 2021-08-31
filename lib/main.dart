import 'package:cod3r_cadastro_usuario/provider/users.dart';
import 'package:cod3r_cadastro_usuario/routes/app_routes.dart';
import 'package:cod3r_cadastro_usuario/views/user_form.dart';
import 'package:cod3r_cadastro_usuario/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (ctx) => Users(),
      )
    ],

    child:
      MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (ctx) => UserList(),
          AppRoutes.USER_FORM: (ctx) => UserForm()
        },
      ) ,
    );
  }
}
