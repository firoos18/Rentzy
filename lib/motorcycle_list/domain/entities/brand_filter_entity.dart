import 'package:equatable/equatable.dart';

class BrandFilterEntity extends Equatable {
  final String? name;
  final String? imageUrl;

  const BrandFilterEntity({this.imageUrl, this.name});

  @override
  List<Object?> get props => [name, imageUrl];
}
