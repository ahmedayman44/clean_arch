import 'package:clean_arch/features/user/domain/entites/user_entity.dart';
import 'package:flutter/material.dart';

class UserDataTile extends StatelessWidget {
  const UserDataTile({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.person),
          iconColor: Colors.blueAccent,
          title: Text(user.name),
        ),
        ListTile(
          leading: Icon(Icons.email),
          iconColor: Colors.blueAccent,
          title: Text(user.email),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          iconColor: Colors.blueAccent,
          title: Text(user.phone),
        ),
        ListTile(
          leading: Icon(Icons.location_city),
          iconColor: Colors.blueAccent,
          title: Text(user.adress.city),
        ),
      ],
    );
  }
}
