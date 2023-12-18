import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cryptos.dart';

class CryptosView extends StatefulWidget {
  const CryptosView({Key? key}) : super(key: key);
  @override
  State<CryptosView> createState() => _CryptoViewState();
}

class _CryptoViewState extends State<CryptosView> {
  @override
  void initState() {
    super.initState();
    context.read<CryptosCubit>().getCryptosCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptosCubit, CryptosState>(
      builder: (context, state) {
        if (state.status == CryptosStateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == CryptosStateStatus.loaded) {
          return ListView.builder(
            itemCount: state.cryptos.length,
            itemBuilder: (context, index) {
              final crypto = state.cryptos[index];
              return CryptoWidget(
                cryptoID: crypto.id,
                cryptoSymbol: crypto.symbol!,
                cryptoName: crypto.name!,
                cryptoImage: crypto.image!,
                cryptoPrice: crypto.price!,
                cryptoChange: crypto.change!,
              );
            },
          );
        }
        return const Text("Pas de données");
      },
    );
  }
}
