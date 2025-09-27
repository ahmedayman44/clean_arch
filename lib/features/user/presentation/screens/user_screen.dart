import 'package:clean_arch/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:clean_arch/features/user/presentation/widgets/get_user_button.dart';
import 'package:clean_arch/features/user/presentation/widgets/land_widget.dart';
import 'package:clean_arch/features/user/presentation/widgets/search_bar_slider.dart';
import 'package:clean_arch/features/user/presentation/widgets/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body:
              state is UserSucess
                  ? ListView(
                    children: [
                      const LandingWidget(),
                      UserDataTile(user: state.user),
                      const CustomSearchBarState(),
                    ],
                  )
                  : state is UserFailure
                  ? Text(state.errorMessage)
                  : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
