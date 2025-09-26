import 'package:clean_arch/core/databases/api/end_points.dart';
import 'package:clean_arch/features/user/data/models/sub_models/geo_model.dart';
import 'package:clean_arch/features/user/domain/entites/sub_entites/adress_entity.dart';

class AdressModel extends AdressEntity {
  AdressModel({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });
  factory AdressModel.fromJson(Map<String, dynamic> json) {
    return AdressModel(
      street: json[ApiKey.street],
      suite: json[ApiKey.suite],
      city: json[ApiKey.city],
      zipcode: json[ApiKey.zipcode],
      geo: GeoModel.fromJson(json[ApiKey.geo]),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      ApiKey.street: street,
      ApiKey.suite: suite,
      ApiKey.city: city,
      ApiKey.zipcode: zipcode,
      ApiKey.geo: geo,
    };
  }
}
