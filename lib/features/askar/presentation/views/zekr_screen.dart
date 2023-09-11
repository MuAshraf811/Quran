import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/askar/presentation/bloc/azkar_bloc.dart';
import 'package:quran/features/askar/presentation/widgets/zekr_data_sabah.dart';
import 'package:quran/features/askar/presentation/widgets/zekr_masaa.dart';
import 'package:quran/features/askar/presentation/widgets/zekr_sala.dart';

import '../../../../core/connectivity/bloc/check_connectivity_bloc.dart';

class ZekrScreen extends StatelessWidget {
  ZekrScreen({super.key, required this.indx});
  final int indx;
  final List<String> title = ['أذكار الصباح', 'أذكار المساء', 'أذكار الصلاة'];
  @override
  Widget build(BuildContext context) {
    final List res = Hive.box('azkarSobeh').get(0);
    final List res1 = Hive.box('azkarMesa').get(0);
    final List res2 = Hive.box('azkarSalah').get(0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: Text(title[indx]),
        centerTitle: true,
      ),
      body: BlocBuilder<CheckConnectivityBloc, CheckConnectivityState>(
        builder: (context, state) {
          if (state is MobileDataConnectionState ||
              state is WifiConnectionState) {
            return BlocConsumer<AzkarBloc, AzkarState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is AzkarLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: appColor,
                    ),
                  );
                } else if (state is AzkarLoaded) {
                  switch (indx) {
                    case 0:
                      {
                        return ZekrSobah(state: state);
                      }

                    case 1:
                      {
                        return ZekrMasa(state: state);
                      }
                    case 2:
                      {
                        return ZekrSala(state: state);
                      }
                    default:
                      {
                        return ZekrSala(state: state);
                      }
                  }
                } else if (state is AzkarLoadingError) {
                  return Center(
                      child: Text(
                    state.error,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ));
                }
                return const SizedBox();
              },
            );
          } else if (state is NoInternetConnectionState) {
            final List res = Hive.box('azkarSobeh').get(0);

            switch (indx) {
              case 0:
                {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 16, right: 12, left: 12, bottom: 24),
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 24),
                      itemCount: res.length,
                      itemBuilder: (context, index) {
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              padding: const EdgeInsets.all(8),
                              width: constraints.maxWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  border: Border.all(
                                    color: appColor,
                                  )),
                              child: Column(
                                children: [
                                  Text(
                                    res[index].zekr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: appColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Divider(
                                    endIndent: 16,
                                    indent: 16,
                                    color: appColor,
                                    thickness: 1,
                                  ),
                                  Text(
                                    '  ${res[index].bless.toString()}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Divider(
                                    endIndent: 16,
                                    indent: 16,
                                    color: appColor,
                                    thickness: 1,
                                  ),
                                  Text(
                                    'التكرار :${res[index].repeat.toString()}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: appColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                }

              default:
                {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 16, right: 12, left: 12, bottom: 24),
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 24),
                      itemCount: res.length,
                      itemBuilder: (context, index) {
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              padding: const EdgeInsets.all(8),
                              width: constraints.maxWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  border: Border.all(
                                    color: appColor,
                                  )),
                              child: Column(
                                children: [
                                  Text(
                                    res[index].zekr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: appColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Divider(
                                    endIndent: 16,
                                    indent: 16,
                                    color: appColor,
                                    thickness: 1,
                                  ),
                                  Text(
                                    '  ${res[index].bless.toString()}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Divider(
                                    endIndent: 16,
                                    indent: 16,
                                    color: appColor,
                                    thickness: 1,
                                  ),
                                  Text(
                                    'التكرار :${res[index].repeat.toString()}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: appColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                }
            }
          }
          switch (indx) {
            case 0:
              return Padding(
                padding: const EdgeInsets.only(
                    top: 16, right: 12, left: 12, bottom: 24),
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                  itemCount: res.length,
                  itemBuilder: (context, index) {
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          width: constraints.maxWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                color: appColor,
                              )),
                          child: Column(
                            children: [
                              Text(
                                res[index].zekr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                endIndent: 16,
                                indent: 16,
                                color: appColor,
                                thickness: 1,
                              ),
                              Text(
                                '  ${res[index].bless.toString()}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                endIndent: 16,
                                indent: 16,
                                color: appColor,
                                thickness: 1,
                              ),
                              Text(
                                'التكرار :${res[index].repeat.toString()}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              );

            case 1:
              return Padding(
                padding: const EdgeInsets.only(
                    top: 16, right: 12, left: 12, bottom: 24),
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                  itemCount: res.length,
                  itemBuilder: (context, index) {
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          width: constraints.maxWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                color: appColor,
                              )),
                          child: Column(
                            children: [
                              Text(
                                res1[index].zekr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                endIndent: 16,
                                indent: 16,
                                color: appColor,
                                thickness: 1,
                              ),
                              Text(
                                '  ${res1[index].bless.toString()}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                endIndent: 16,
                                indent: 16,
                                color: appColor,
                                thickness: 1,
                              ),
                              Text(
                                'التكرار :${res1[index].repeat.toString()}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            case 2:
              return Padding(
                padding: const EdgeInsets.only(
                    top: 16, right: 12, left: 12, bottom: 24),
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                  itemCount: res.length,
                  itemBuilder: (context, index) {
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          width: constraints.maxWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                color: appColor,
                              )),
                          child: Column(
                            children: [
                              Text(
                                res2[index].zekr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                endIndent: 16,
                                indent: 16,
                                color: appColor,
                                thickness: 1,
                              ),
                              Text(
                                '  ${res2[index].bless.toString()}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                endIndent: 16,
                                indent: 16,
                                color: appColor,
                                thickness: 1,
                              ),
                              Text(
                                'التكرار :${res2[index].repeat.toString()}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            default:
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, right: 12, left: 12, bottom: 24),
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                  itemCount: res.length,
                  itemBuilder: (context, index) {
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          width: constraints.maxWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                color: appColor,
                              )),
                          child: Column(
                            children: [
                              Text(
                                res[index].zekr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                endIndent: 16,
                                indent: 16,
                                color: appColor,
                                thickness: 1,
                              ),
                              Text(
                                '  ${res[index].bless.toString()}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                endIndent: 16,
                                indent: 16,
                                color: appColor,
                                thickness: 1,
                              ),
                              Text(
                                'التكرار :${res[index].repeat.toString()}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              );
          }
          throw Exception('errer');
        },
      ),
    );
  }
}
