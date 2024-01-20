
import 'package:bloc/bloc.dart';
import 'package:todo/domain/bloc/Settings_page/settings_page_states.dart';
import 'package:todo/domain/usecase/delete_account_use_case.dart';
import 'package:todo/domain/usecase/log_out_use_case.dart';

import '../navigator_bloc.dart';
import 'settings_page_events.dart';


class SettingsPageBloc extends Bloc<UserEvent,UserStates>  {
  NavigatorBloc navigatorBloc;
  LogOutUseCase logOutUseCase;
  DeleteAccountUseCase deleteAccountUseCase;
  SettingsPageBloc({ required this.logOutUseCase, required this.navigatorBloc , required this.deleteAccountUseCase}) : super(SettingsPageLoadedState()){
    emit(SettingsPageLoadedState());
    on<LogOutEvent>((event, emit) async {
      try{
        final result =  await logOutUseCase.logOut();
        result ? navigatorBloc.add(NavigateToSignIn()) : emit(ErrorLogOutState());
      } catch (_) {
        emit(ErrorLogOutState());
      }
    }
    );
    on<DeleteAccountEvent> ((event, emit) async {
      try {
        final result = await deleteAccountUseCase.delAccount();
        result ? navigatorBloc.add(NavigateToSignIn()) : emit(
            ErrorDeleteAccountState());
      } catch (_) {
        emit(ErrorDeleteAccountState());
      }
    }
    );
  }

}