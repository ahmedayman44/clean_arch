import 'package:bloc/bloc.dart';
import 'package:clean_arch/core/connections/network_info.dart';
import 'package:clean_arch/core/databases/api/dio_consumer.dart';
import 'package:clean_arch/core/databases/cache/cache_helper.dart';
import 'package:clean_arch/core/params/params.dart';
import 'package:clean_arch/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_arch/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_arch/features/user/data/repos/user_repo_impl.dart';
import 'package:clean_arch/features/user/domain/entites/user_entity.dart';
import 'package:clean_arch/features/user/domain/usecases/get_user.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  eitherFailureOrUser(int id) async {
    emit(UserLoading());

    final userOrFailure = await GetUser(
      repos: UserRepoImpl(
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
        remoteDataSource: UserRemoteDataSource(
          apiConsumer: DioConsumer(dio: Dio()),
        ),
        localDataSource: UserLocalDataSource(cache: CacheHelper()),
      ),
    ).call(params: UserParams(id: id.toString()));

    userOrFailure.fold(
      (failure) => emit(UserFailure(errorMessage: failure.errMessage)),
      (user) => emit(UserSucess(user: user)),
    );
  }
}
