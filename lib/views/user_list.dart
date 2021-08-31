import 'package:cod3r_cadastro_usuario/components/user_tile.dart';
import 'package:cod3r_cadastro_usuario/models/user.dart';
import 'package:cod3r_cadastro_usuario/provider/users.dart';
import 'package:cod3r_cadastro_usuario/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final Users users =Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM, arguments: User(id: '', name: '', email: '', avatarUrl: '') );
            },
            icon: Icon(Icons.add),
            color: Colors.green,
          )
        ],
      ),

      body: ListView.builder(
        itemCount: users.count,

        itemBuilder:(ctx, i) => UserTile(users.byIndex(i))
      ),
    );
  }
}