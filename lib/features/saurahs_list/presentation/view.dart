import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/saurah_content/presentation/bloc/all_ayahs_bloc.dart';
import 'package:quran/features/saurah_content/presentation/screens/saurah_content.dart';
import 'package:quran/features/saurahs_list/presentation/bloc/saurahs_bloc.dart';

class AllSaurahs extends StatelessWidget {
  const AllSaurahs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SaurahsBloc>(
      create: (context) => SaurahsBloc()..add(IntialEvent()),
      child: BlocConsumer<SaurahsBloc, SaurahsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is FetchingSaurahs) {
            return const Center(
              child: CircularProgressIndicator(
                color: appColor,
              ),
            );
          } else if (state is FetchingSaurahsDone) {
            return ListView.separated(
              itemCount: state.list.length,
              separatorBuilder: (context, index) => const Divider(
                  color: appColor, endIndent: 48, indent: 48, thickness: 1),
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: appColor,
                  focusColor: appColor,
                  onTap: () {
                    BlocProvider.of<AllAyahsBloc>(context)
                        .add(IntialEventToLoadAyas());
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context ) =>
                          SaurahContent(name: state.list[index].name , indexx: state.list[index].number, ayahsNumber:state.list[index].numberOfAyahs , ),
                    ));
                  },
                  child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          state.list[index].englishNameTranslation,
                          style: const TextStyle(
                            color: appColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          '${state.list[index].revelationType} (${state.list[index].numberOfAyahs})',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Text(
                              state.list[index].name,
                              style: const TextStyle(
                                color: appColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            state.list[index].revelationType == 'Meccan'
                                ? const Text(
                                    'مكية',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  )
                                : const Text(
                                    'مدنية',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                          ],
                        ),
                      )),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
