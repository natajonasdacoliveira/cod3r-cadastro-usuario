import 'package:cod3r_cadastro_usuario/models/user.dart';
import 'package:cod3r_cadastro_usuario/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>(); 
  final Map<String, String>_formData = {};
      
  void _loadFormData(User user) {
    if(user.id.isNotEmpty) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;    
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de usuário'),
        actions: <Widget> [
          IconButton(onPressed: () {

            final isValid = _form.currentState!.validate();

            if(isValid) {
              _form.currentState!.save();

              bool edit = _formData['id'] == null;
              
              Provider.of<Users>(context, listen: false).put(User(
                id:edit ? '' : (_formData['id'])!, 
                name:(_formData['name'])!, 
                email:(_formData['email'])!, 
                avatarUrl:(_formData['avatarUrl'])!, 
              ));

              Navigator.of(context).pop();
            }
          }, icon:Icon(Icons.save))
        ],
      ),
      
      body: Padding(
        padding: EdgeInsets.all(15),

        child: Form(
          key: _form,

          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(
                  labelText: 'Nome'
                ),

                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Preencha o seu nome corretamente';
                  }                
                },

                onSaved: (value) => _formData['name'] = value!,
              ),

              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(
                  labelText: 'E-mail'
                ),

                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Preencha o seu e-mail corretamente';
                  }
                },

                onSaved: (value) => _formData['email'] = value!,
              ),

              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(
                  labelText: 'URL Avatar'
                ),

                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
            ])
        )
      ),
    );
  }
}