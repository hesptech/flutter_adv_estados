part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {
  const UsersEvent();
}


final class AddUser extends UsersEvent{
  final User user;
  const AddUser( this.user );
}

class DeleteUsers extends UsersEvent {}