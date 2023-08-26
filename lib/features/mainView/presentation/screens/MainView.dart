import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/Masbha/presentation/views/masbha.dart';
import 'package:quran/features/adzan/presentation/screen/adzan_screen.dart';
import 'package:quran/features/askar/presentation/views/main_azkar_view.dart';
import 'package:quran/features/mainView/presentation/widgets/custom_grid_elemnt.dart';
import 'package:quran/features/mainView/presentation/widgets/custom_snackbar.dart';
import 'package:quran/features/qibla/presentation/views/qibla_view.dart';
import '../../../../core/connectivity/bloc/check_connectivity_bloc.dart';
import '../../../adzan/presentation/bloc/azan_bloc.dart';
import '../../../saurahs_list/presentation/view.dart';
import '../widgets/azan_row.dart';
import '../widgets/custom_navigator_function.dart';
import '../widgets/upper_clipped_container.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckConnectivityBloc, CheckConnectivityState>(
      listener: (context, state) {
        if (state is MobileDataConnectionState) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
              content: 'You are now using the online version of this app'));
        } else if (state is WifiConnectionState) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
              content: 'You are now using the online version of this app'));
        } else if (state is NoInternetConnectionState) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
              content: 'You are now using the offline version of this app'));
        }
      },
      child: Column(
        children: [
          const UpperClippedContainer(),
          BlocBuilder<AzanBloc, AzanState>(
            builder: (context, state) {
              if (state is AzanLoaded) {
                return RowPresentingAzanTimings(
                  state: state,
                );
              }
              return const SizedBox();
            },
          ),
          Expanded(
            child: GridView.builder(
              itemCount: gridInformation.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (index == 0) {
                     customNavigationMethodWithCustomNavigator(
                          context,const AllSaurahs());
                    } else if (index == 1) {
                     customNavigationMethodWithCustomNavigator(
                          context, Masbha());
                    } else if (index == 2) {
                      customNavigationMethodWithCustomNavigator(
                          context, MainAzkarView());
                    } else if (index == 4) {
                     customNavigationMethodWithCustomNavigator(
                          context,const AdzanScreen());
                    } else if (index == 5) {
                      customNavigationMethodWithCustomNavigator(
                          context,const QiblaView());
                      
                    }
                  },
                  child: CustomGridElemnt(
                    indx: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
