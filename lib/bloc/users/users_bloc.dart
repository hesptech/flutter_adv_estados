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

    on<DeleteUsers>( (event, emit ) => emit( const UsersInitialState() ));

  }

  void _addUserHandler( AddUser event, Emitter<UsersState> emit ) {
    
    final newUser = User(
      nombre: event.user.nombre,
      edad: event.user.edad,
      profesiones: event.user.profesiones,
    );

    emit(state.copyWith(users: [...state.users, newUser], existUsers: true));
  }

  void addUser( User user ) {
    add( AddUser(user) );
  }
}