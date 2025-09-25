import 'package:clean_arch/features/user/domain/entites/sub_entites/adress_entity.dart';

class UserEntity {
  final String name;
  final String phone;
  final String email;
  final AdressEntity adressEntity;

  UserEntity({
    required this.name,
    required this.phone,
    required this.email,
    required this.adressEntity,
  });
}
