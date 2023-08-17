// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import 'package:quran/features/saurahs_list/data/remote.dart';
import 'package:quran/features/saurahs_list/model/model.dart';

part 'saurahs_event.dart';
part 'saurahs_state.dart';

class SaurahsBloc extends Bloc<SaurahsEvent, SaurahsState> {
  SaurahsBloc() : super(SaurahsInitial()) {
    on<IntialEvent>((event, emit) async {
      emit(FetchingSaurahs());
      Map response = await DataFromApi.fetchData();
      List listres = response['data']['surahs']['references'];
      List<DataModel> listofModel = listres.map((e) => DataModel.fromJson(e)).toList();
      if (listofModel.isNotEmpty) {
        emit(FetchingSaurahsDone(list: listofModel));
      } else {
        emit(FetchingSaurahsError());
      }
    });
  }
}
