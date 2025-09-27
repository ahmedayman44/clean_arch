import 'package:clean_arch/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:clean_arch/features/user/presentation/widgets/get_user_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchBarState extends StatefulWidget {
  const CustomSearchBarState({super.key});

  @override
  State<CustomSearchBarState> createState() => _CustomSearchBarStateState();
}

class _CustomSearchBarStateState extends State<CustomSearchBarState> {
  double id = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: id,
          onChanged: (value) {
            setState(() {
              id = value;
            });
          },
          min: 1,
          max: 10,
          divisions: 9,
          label: '${id.toInt()}',
        ),
        GetUserBotton(
          onPressed: () {
            BlocProvider.of<UserCubit>(context).eitherFailureOrUser(id.toInt());
          },
        ),
      ],
    );
  }
}
