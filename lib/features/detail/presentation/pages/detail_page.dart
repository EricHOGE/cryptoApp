import 'package:crypto/features/chart/domain/usecases/get_chart_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeral/numeral.dart';

import '../../../../provider/repository_provider.dart';
import '../../../chart/presentation/cubit/chart_cubit.dart';
import '../../../chart/presentation/view/chart_view.dart';

class DetailPage extends StatelessWidget {
  final getChartUsecase =
      GetChartUsecase(BaseRepositoryProvider.chartRepoProvider);

  DetailPage({
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
    return CupertinoPopupSurface(
      isSurfacePainted: true,
      child: Material(
        child: Container(
          color: const Color.fromARGB(255, 31, 31, 31),
          padding: const EdgeInsetsDirectional.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).copyWith().size.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.network(
                  cryptoImage,
                  height: 45,
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      cryptoSymbol.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 29),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        cryptoName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  padding: const EdgeInsets.all(0),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: Icon(
                      Icons.close_rounded,
                      size: 23,
                      color: Colors.grey.shade400,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Divider(color: Colors.grey.shade600),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${Numeral(cryptoPrice).format()}\$',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          cryptoChange > 0
                              ? Text(
                                  '+${cryptoChange.toStringAsFixed(1)}%',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 73, 199, 79),
                                  ),
                                )
                              : Text(
                                  '${cryptoChange.toStringAsFixed(1)}%',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 255, 0, 0),
                                  ),
                                ),
                        ],
                      ),
                      const Text(
                        'USD',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Divider(color: Colors.grey.shade600),
                      BlocProvider(
                        create: (context) =>
                            ChartCubit(getChartUsecase: getChartUsecase),
                        child: ChartView(
                          cryptoID: cryptoID,
                          cryptoChange: cryptoChange,
                        ),
                      ),
                      // Divider(color: Colors.grey.shade600),
                      // BlocProvider(
                      //   create: (context) => NewsCubit(),
                      //   child: NewsView(
                      //     cryptoID: cryptoID,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
