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

  }

  void _addUserHandler( AddUser event, Emitter<UsersState> emit ) {
    
    final newUser = User(
      nombre: 'user',
      edad: 12,
      profesiones: []
    );

    emit(state.copyWith(users: [...state.users, newUser], existUsers: true));
  }

  void addUser( User user ) {
    add( AddUser(user) );
  }
}