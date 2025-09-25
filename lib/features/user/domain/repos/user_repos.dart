import 'package:clean_arch/core/errors/failure.dart';
import 'package:clean_arch/core/params/params.dart';
import 'package:clean_arch/features/user/domain/entites/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepos {
  Future<Either<Failure, UserEntity>> getUser({required UserParams params});
}
