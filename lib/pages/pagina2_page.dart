import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/models/user.dart';
import '/config/config.dart';
import '/bloc/user/user_bloc.dart';
import '/bloc/users/users_bloc.dart';


class Pagina2Page extends StatelessWidget {
  
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context, listen: false );
    final usersBloc = BlocProvider.of<UsersBloc>(context, listen: false );


    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              color: Colors.blue,
              onPressed: () {

                final newUser = User(
                  nombre: RandomGenerator.getRandomName(),
                  edad: RandomAge.getRandomAge(),
                  profesiones: [ RandomProfession.getRandomProfession() ],
                );

                context.read<UsersBloc>().addUser(newUser);

                // BlocProvider.of<UserBloc>(context, listen: false ).add( ActivateUser(newUser) );
                userBloc.add( ActivateUser(newUser) );
              },
              child: const Text('Create random User', style: TextStyle( color: Colors.white ) )
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                // from 1 to 10 included  
                int randomnum = RandomAge.getRandomAge();
                userBloc.add( ChangeUserAge(randomnum) );
                print(randomnum);

                final user = context.read<UserBloc>().state.user;
                final newUser = User(
                  nombre: user!.nombre,
                  edad: randomnum,
                  profesiones: user.profesiones,
                );
                print(newUser.edad);
                usersBloc.add( UpdateUser( newUser ) );
                //usersBloc.addUser(newUser);

              },
              child: const Text('Cambiar Edad', style: TextStyle( color: Colors.white ) )
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () {

                userBloc.add( AddProfession('Nueva Profesión') );
              },
              child: const Text('Añadir Profesion', style: TextStyle( color: Colors.white ) )
            ),

          ],
        )
     ),
   );
  }
}