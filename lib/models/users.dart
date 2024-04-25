import 'package:flutter_adv_estados/models/user.dart';

class Users {
  
  final List<User> users;

  Users({
    required this.users
  });

  Users copyWith({
  final List<User>? users,
  }) => Users(
    users: users ?? this.users
  );
}