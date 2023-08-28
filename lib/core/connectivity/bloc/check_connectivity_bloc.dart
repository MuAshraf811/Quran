import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'check_connectivity_event.dart';
part 'check_connectivity_state.dart';

class CheckConnectivityBloc
    extends Bloc<CheckConnectivityEvent, CheckConnectivityState> {
  CheckConnectivityBloc() : super(CheckConnectivityInitial()) {
    on<InternetConnectionEvent>(
      (event, emit) {
        emit(MobileDataConnectionState());
      },
    );
    on<WifiConnectionEvent>(
      (event, emit) {
        emit(WifiConnectionState());
      },
    );

    on<NoInternetConnectionEvent>(
      (event, emit) {
        emit(NoInternetConnectionState());
      },
    );

    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult res) {
        if (res == ConnectivityResult.mobile) {
          add(InternetConnectionEvent());
        } else if (res == ConnectivityResult.wifi) {
          add(WifiConnectionEvent());
        } else if (res == ConnectivityResult.none) {
          add(NoInternetConnectionEvent());
        }
      },
    );
    
  }
  
}
