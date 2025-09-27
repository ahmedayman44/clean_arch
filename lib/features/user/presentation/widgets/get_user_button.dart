import 'package:flutter/material.dart';

class GetUserBotton extends StatelessWidget {
  const GetUserBotton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text('Get User'));
  }
}
