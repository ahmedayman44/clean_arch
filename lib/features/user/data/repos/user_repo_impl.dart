import 'package:clean_arch/core/connections/network_info.dart';
import 'package:clean_arch/core/errors/expentions.dart';
import 'package:clean_arch/core/errors/failure.dart';
import 'package:clean_arch/core/params/params.dart';
import 'package:clean_arch/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_arch/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_arch/features/user/domain/entites/user_entity.dart';
import 'package:clean_arch/features/user/domain/repos/user_repos.dart';
import 'package:dartz/dartz.dart';

class UserRepoImpl extends UserRepos {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepoImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> getUser({
    required UserParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await remoteDataSource.getUser(params);
        localDataSource.cachUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = await localDataSource.getLastUser();
        return Right(localUser);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}



































// import 'package:clean_arch/core/connections/network_info.dart';







// import 'package:clean_arch/core/errors/expentions.dart';
// import 'package:clean_arch/core/errors/failure.dart';
// import 'package:clean_arch/core/params/params.dart';
// import 'package:clean_arch/features/user/data/datasources/user_local_data_source.dart';
// import 'package:clean_arch/features/user/data/datasources/user_remote_data_source.dart';
// import 'package:clean_arch/features/user/domain/entites/user_entity.dart';
// import 'package:clean_arch/features/user/domain/repos/user_repos.dart';
// import 'package:dartz/dartz.dart';

// class UserRepoImpl extends UserRepos {
//   final NetworkInfo networkInfo;
//   final UserRemoteDataSource remoteDataSource;
//   final UserLocalDataSource localDataSource;

//   UserRepoImpl({
//     required this.remoteDataSource,
//     required this.localDataSource,
//     required this.networkInfo,
//   });

//   @override
//   Future<Either<Failure, UserEntity>> getUser({
//     required UserParams params,
//   }) async {
//     if (await networkInfo.isConnected!) {
//       try {
//         final remoteUser = await remoteDataSource.getUser(params);
//         localDataSource.cachUser(remoteUser);
//         return Right(remoteUser);
//       } on ServerException catch (e) {
//         return left(Failure(errMessage: e.errorModel.errorMessage));
//       }
//     } else {
//       try {
//         final localUser = await localDataSource.getLastUser();
//         return Right(localUser);
//       } on CacheExeption catch (e) {
//         return left(Failure(errMessage: e.errorMessage));
//       }
//     }
//   }
// }
