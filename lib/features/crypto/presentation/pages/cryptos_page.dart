import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../provider/repository_provider.dart';
import '../../cryptos.dart';

class CryptosPage extends StatefulWidget {
  const CryptosPage({super.key});

  @override
  State<CryptosPage> createState() => _CryptosPageState();
}

class _CryptosPageState extends State<CryptosPage> {
  final getCryptosUseCase =
      GetCryptosUseCase(BaseRepositoryProvider.cryptosRepoProvider);

  String currentDate = '';

  getCurrentDate() {
    var now = DateTime.now();
    var formatter = DateFormat('dd MMMM');
    setState(() {
      currentDate = formatter.format(now);
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentDate();
  }

  void showDetail(context) {}

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black,
        leading: const Text(
          'Crypto',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
        ),
        middle: Text(
          currentDate,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.grey,
          ),
        ),
        trailing: Material(
          color: Colors.black,
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ),
      ),
      child: SafeArea(
        child: BlocProvider(
          create: (context) =>
              CryptosCubit(getCryptosUseCase: getCryptosUseCase),
          child: const CryptosView(),
        ),
      ),
    );
  }
}
