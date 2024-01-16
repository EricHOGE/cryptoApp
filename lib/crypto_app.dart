import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/crypto/presentation/pages/cryptos_page.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      title: 'Crypto App',
      debugShowCheckedModeBanner: false,
      home: CryptosPage(),
    );
  }
}
