import 'package:clean_arch/core/databases/cache/cache_helper.dart';
import 'package:clean_arch/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:clean_arch/features/user/presentation/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => UserCubit()..eitherFailureOrUser(1),
        child: UserScreen(),
      ),
    );
  }
}
