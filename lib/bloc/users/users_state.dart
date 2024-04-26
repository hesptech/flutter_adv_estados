part of 'users_bloc.dart';

class UsersState {

  final bool existUsers;
  final List<User> users;

  const UsersState({
    this.existUsers = false, 
    this.users = const [],
  });

  int get howManyUsers => users.length;

  UsersState copyWith({
    final bool? existUsers,
    final List<User>? users,
  }) => UsersState(
    existUsers: existUsers ?? this.existUsers,
    users: users ?? this.users
  );
}
