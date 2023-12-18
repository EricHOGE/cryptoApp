import 'package:equatable/equatable.dart';

class CryptoEntity extends Equatable {
  final String id;
  final String? name;
  final String? symbol;
  final String? image;
  final num? price;
  final num? change;

  const CryptoEntity({
    required this.id,
    this.name,
    this.symbol,
    this.image,
    this.price,
    this.change,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        symbol,
        image,
        price,
        change,
      ];
}
