import 'package:equatable/equatable.dart';

import '../../domain/entities/crypto_entity.dart';

class CryptoModel extends Equatable {
  final String id;
  final String? name;
  final String? symbol;
  final String? image;
  final num? price;
  final num? change;

  const CryptoModel({
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

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
        id: json['id'] as String,
        name: json['name'] as String,
        symbol: json['symbol'] as String,
        image: json['image'] as String,
        price: json['current_price'] as num,
        change: json['price_change_percentage_24h'] as num,
      );

  CryptoEntity toDomain() {
    return CryptoEntity(
      id: id,
      name: name,
      symbol: symbol,
      image: image,
      price: price ?? 0,
      change: change ?? 0,
    );
  }
}
