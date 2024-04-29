import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '/models/user.dart';
import '/config/config.dart';

part 'user_event.dart';
part 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {

  final void Function( int newAge )? onNewUserCallBack;
  
  UserBloc({this.onNewUserCallBack}) : super( const UserInitialState() ) {


    on<ActivateUser>( (event, emit ) => emit( UserSetState( event.user ) ));
    
    
    on<DeleteUser>( (event, emit ) => emit( const UserInitialState() ));


    on<ChangeUserAge>((event, emit) {
      if ( !state.existUser ) return;
      
      int randomnum = RandomAge.getRandomAge();
      
      //emit( UserSetState( state.user!.copyWith( edad: event.age ) ) );
      emit( UserSetState( state.user!.copyWith( edad: randomnum ) ) );

      onNewUserCallBack?.call( randomnum );
    });


    on<AddProfession>((event, emit) {
      if ( !state.existUser ) return;

      String randomProfession = RandomProfession.getRandomProfession();

      String newAddedProffesion = state.user!.profesiones.contains(randomProfession) ? ' - ' : randomProfession;
        
      final professions = [...state.user!.profesiones, newAddedProffesion ];
      emit( UserSetState( state.user!.copyWith( profesiones: professions ) ) );
    });

  }
}
