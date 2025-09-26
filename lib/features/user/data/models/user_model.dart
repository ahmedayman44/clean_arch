import 'package:clean_arch/core/databases/api/end_points.dart';
import 'package:clean_arch/features/user/data/models/sub_models/adress_model.dart';
import 'package:clean_arch/features/user/data/models/sub_models/company_model.dart';
import 'package:clean_arch/features/user/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  final int id;
  final String username;
  final String website;
  final CompanyModel company;

  UserModel({
    required this.id,
    required this.username,
    required this.website,
    required this.company,
    required super.name,
    required super.phone,
    required super.email,
    required super.adress,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[ApiKey.id],
      username: json[ApiKey.username],
      website: json[ApiKey.website],
      name: json[ApiKey.name],
      phone: json[ApiKey.phone],
      email: json[ApiKey.email],
      adress: AdressModel.fromJson(json[ApiKey.address]),
      company: CompanyModel.fromJson(json[ApiKey.company]),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: ApiKey.id,
      ApiKey.username: ApiKey.username,
      ApiKey.website: ApiKey.website,
      ApiKey.company: ApiKey.company,
      ApiKey.name: ApiKey.name,
      ApiKey.phone: ApiKey.phone,
      ApiKey.email: ApiKey.email,
      ApiKey.address: ApiKey.address,
    };
  }
}
