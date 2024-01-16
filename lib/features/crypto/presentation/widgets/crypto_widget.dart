import 'package:crypto_app/features/crypto/presentation/widgets/price_down_widget.dart';
import 'package:crypto_app/features/crypto/presentation/widgets/price_up_widget.dart';
import 'package:crypto_app/features/detail/presentation/pages/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';

class CryptoWidget extends StatelessWidget {
  const CryptoWidget({
    Key? key,
    required this.cryptoID,
    required this.cryptoSymbol,
    required this.cryptoName,
    required this.cryptoImage,
    required this.cryptoPrice,
    required this.cryptoChange,
  }) : super(key: key);
  final String cryptoID;
  final String cryptoSymbol;
  final String cryptoName;
  final String cryptoImage;
  final num cryptoPrice;
  final num cryptoChange;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: InkWell(
        onTap: () {
          showDetail(
            context,
            cryptoID,
            cryptoName,
            cryptoImage,
            cryptoPrice,
            cryptoChange,
          );
        },
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, bottom: 5),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 0.5,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
            ListTile(
              textColor: Colors.white,
              leading: buildImage(cryptoImage),
              title: _buildTitle(),
              subtitle: _buildSubtitle(),
              trailing: _buildTrailing(),
            ),
          ],
        ),
      ),
    );
  }

  void showDetail(
    context,
    String cryptoID,
    String cryptoName,
    String cryptoImage,
    num cryptoPrice,
    num cryptoChange,
  ) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return DetailPage(
            cryptoID: cryptoID,
            cryptoSymbol: cryptoSymbol,
            cryptoName: cryptoName,
            cryptoImage: cryptoImage,
            cryptoPrice: cryptoPrice,
            cryptoChange: cryptoChange,
          );
        });
  }

  Widget buildImage(String imageUrl) {
    return imageUrl.isNotEmpty
        ? Image.network(imageUrl, height: 45)
        : Image.asset('assets/crypto.png');
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Text(cryptoSymbol.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
        const SizedBox(width: 5),
        const Text('USD',
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 15, color: Colors.grey)),
      ],
    );
  }

  Widget _buildSubtitle() {
    return Text(cryptoName,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 15, color: Colors.grey));
  }

  Widget _buildTrailing() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(Numeral(cryptoPrice).format(),
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 19)),
        const SizedBox(height: 2),
        cryptoChange > 0
            ? PriceUpWidget(cryptoChange: cryptoChange)
            : PriceDownWidget(cryptoChange: cryptoChange),
      ],
    );
  }
}
