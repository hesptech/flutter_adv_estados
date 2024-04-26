import 'package:flutter/material.dart';
import 'package:flutter_adv_estados/bloc/users/users_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/user/user_bloc.dart';
import '/models/user.dart';
import '/config/config.dart';


class Pagina1Page extends StatelessWidget {
  
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        actions: [
          IconButton(
            icon: const Icon( Icons.delete_outline ),
            onPressed: (){
              BlocProvider.of<UserBloc>(context, listen: false )
                .add(DeleteUser());
            }, 
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: ( _ , state) {          

          return state.existUser
            ? InformacionUsuario( user: state.user! )
            : Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 100.0),
                    child: Text('no Users'),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                  
                        final newUser = User(
                          nombre: RandomGenerator.getRandomName(),
                          edad: 36,
                          profesiones: [ 'FullStack Developer']
                        );
                  
                        context.read<UsersBloc>().addUser(newUser);
                  
                        // BlocProvider.of<UserBloc>(context, listen: false ).add( ActivateUser(newUser) );
                        BlocProvider.of<UserBloc>(context, listen: false ).add( ActivateUser(newUser) );
                      },
                      child: const Text('create random User...', style: TextStyle( color: Colors.white ) )
                    ),
                  ),                  
                      ],
                    ),
                  );
    
        },
      ),

     floatingActionButton: FloatingActionButton(
       child: const Icon( Icons.accessibility_new ),
       onPressed: () => Navigator.pushNamed(context, 'pagina2')
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

  final User user;
  
  const InformacionUsuario({
    Key? key, 
    required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
            
                  final newUser = User(
                    nombre: RandomGenerator.getRandomName(),
                    edad: 36,
                    profesiones: [ 'FullStack Developer']
                  );
            
                  context.read<UsersBloc>().addUser(newUser);
            
                  // BlocProvider.of<UserBloc>(context, listen: false ).add( ActivateUser(newUser) );
                  BlocProvider.of<UserBloc>(context, listen: false ).add( ActivateUser(newUser) );
                },
                child: const Text('Create random User', style: TextStyle( color: Colors.white ) )
              ),
            ),


        _UserView(user: user),

        const _UsersView()
      ],
    );
  }

}

class _UserView extends StatelessWidget {
  const _UserView({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text('New User:', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),

          ListTile( title: Text('Name: ${ user.nombre }') ),
          ListTile( title: Text('Age: ${ user.edad }') ),

          const SizedBox(height: 10.0,),
          const Text('Profesions:', style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold ) ),
          const Divider(),

          ...user.profesiones.map( 
            (prof) => ListTile( title: Text(prof) )
          ).toList()

        ],
      ),
    );
  }
}


class _UsersView extends StatelessWidget {
  const _UsersView();

  @override
  Widget build(BuildContext context) {

    final usersBloc = context.watch<UsersBloc>();
    final usersExist = usersBloc.state.existUsers;
    final usersLenght = usersBloc.state.howManyUsers;

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    
          const Text('List of Users:', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),

          usersExist ? 
          ListTile( title: Text('number of users: $usersLenght ') ) : 
          const ListTile( title: Text('number of users:: 0 ') ) ,
    
        ],
      ),
    ) ;
  }
}