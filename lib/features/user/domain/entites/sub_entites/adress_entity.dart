import 'package:clean_arch/features/user/domain/entites/sub_entites/geo_entity.dart';

class AdressEntity {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity geoEntity;

  AdressEntity({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geoEntity,
  });
}
