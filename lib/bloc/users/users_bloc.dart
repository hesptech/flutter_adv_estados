import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';
//import '/models/users.dart';


part 'users_event.dart';
part 'users_state.dart';


class UsersBloc extends Bloc<UsersEvent, UsersState> {

  UsersBloc() : super( const UsersState(
    users: []
  )) {

    on<AddUser>(_addUserHandler);

    on<UpdateUser>(_updateUserHandler);

    on<DeleteUsers>( (event, emit ) => emit( const UsersInitialState() ));

  }

  void _addUserHandler( AddUser event, Emitter<UsersState> emit ) {
    
    /* final newUser = User(
      nombre: event.user.nombre,
      edad: event.user.edad,
      profesiones: event.user.profesiones,
    ); */

    emit(state.copyWith(users: [...state.users, event.user], existUsers: true));
  }


  void _updateUserHandler( UpdateUser event, Emitter<UsersState> emit ) {
    
    for (var i = 0; i < state.users.length; i++){
      if(state.users[i].nombre == event.user.nombre) {
        state.users.removeAt(i);
      }
    }

    final newUser = User(
      nombre: event.user.nombre,
      edad: event.user.edad,
      profesiones: event.user.profesiones,
    );

    //emit(state.copyWith(users: state.users, existUsers: true));
    emit(state.copyWith(users: [...state.users, event.user], existUsers: true));
    //emit(state.copyWith(users: [...state.users, newUser], existUsers: true));


  }


  void addUser( User user ) {
    add( AddUser(user) );
  }

  void updateUser( User user ) {
    add( UpdateUser(user) );
  }
}