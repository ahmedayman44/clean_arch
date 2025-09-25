import 'package:clean_arch/core/errors/failure.dart';
import 'package:clean_arch/features/user/domain/entites/user_entity.dart';
import 'package:clean_arch/features/user/domain/repos/user_repos.dart';
import 'package:dartz/dartz.dart';

class GetUser {
  final UserRepos repos;

  GetUser({required this.repos});

  Future<Either<Failure, UserEntity>> call() {
    return repos.getUser();
  }
}
