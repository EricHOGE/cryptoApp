import 'package:crypto_app/crypto_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/crypto/crypto_bloc_observer.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  Bloc.observer = CryptoBlocObserver();
  runApp(const CryptoApp());
}
