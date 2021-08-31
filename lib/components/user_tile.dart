import 'package:cod3r_cadastro_usuario/models/user.dart';
import 'package:cod3r_cadastro_usuario/provider/users.dart';
import 'package:cod3r_cadastro_usuario/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {

  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {

    final Users users = Provider.of(context, listen: false); 

    final avatar = user.avatarUrl.isEmpty
      ? CircleAvatar(child:Icon(Icons.person))
      : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    return ListTile(
      leading: avatar,
      title: Text(user.name +"  "+ user.id),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,

        child: Row(
          children:<Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM, arguments: user);
              },
              icon: Icon(Icons.edit)
            ),

            IconButton(
              onPressed: () {
                showDialog(context: context, builder: (ctx) => AlertDialog(
                  title: Text('Excluir usuário'),
                  content: Text('Confirmar exclusão'),
                  actions: <Widget>[
                    TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text('Não')),
                    ElevatedButton(onPressed: () {users.remove(user); Navigator.of(context).pop();}, child: Text('Sim')),
                  ],
                ));
              }, 
              icon: Icon(Icons.delete),
              color: Colors.red
            )
          ]
        ),
      )
    );
  }
}