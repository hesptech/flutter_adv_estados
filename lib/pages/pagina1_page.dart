import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/config.dart';
import '/models/user.dart';
import '/bloc/user/user_bloc.dart';
import '/bloc/users/users_bloc.dart';


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

          //final usersBloc = context.watch<UsersBloc>().state.users;
          int min = 18;
          int max = 60;        

          return ListView(
            children: [
              state.existUser
              //return usersBloc.isNotEmpty && state.existUser
                ? InformacionUsuario( user: state.user! )
                : Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 80.0),
                        child: Text('no New User'),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                      
                            final newUser = User(
                              nombre: RandomGenerator.getRandomName(),
                              edad: min + Random().nextInt((max + 1) - min),
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
                      ),

              const _UsersView()

            ],
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

    int min = 18;
    int max = 60;

    return Column(
      children: [

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
            
                  final newUser = User(
                    nombre: RandomGenerator.getRandomName(),
                    edad: min + Random().nextInt((max + 1) - min),
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

    print(user.profesiones);

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

    //var revList = usersBloc.state.users.reversed.toList();

    return usersBloc.state.users.isNotEmpty ? Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    
          const Text('List of Users:', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),

          usersExist ? 
          ListTile( title: Text('number of users: $usersLenght ') ) : 
          const ListTile( title: Text('number of users:: 0 ') ) ,

          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            reverse: true,
            itemCount: usersLenght,
            itemBuilder: (context, index) {

              //final guest = usersBloc.state.users[index];
              final profesiones = usersBloc.state.users[index].profesiones.join(', ');
              print(usersBloc.state.users[index].profesiones);

              return ListTile(
                title: Text(usersBloc.state.users[index].nombre),
                subtitle: Text('${usersBloc.state.users[index].edad} - $profesiones'),
                //subtitle: Text(profesiones),

              );
            })
    
        ],
      ),
    ) :
        const Text('nos users')
    ;
  }
}