
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/domain/bloc/navigator_bloc.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_bloc.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_events.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_states.dart';

import 'package:todo/domain/usecase/sign_up_use_case.dart';


class MockNavigatorBloc extends Mock implements NavigatorBloc {}
class MockSignUpUseCase extends Mock implements SignUpUseCase {}

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  group('SignUpBloc', ()
  {
    late SignUpBloc signUpBloc;
    late MockNavigatorBloc mockNavigatorBloc;
    late MockSignUpUseCase mockSignUpUseCase;
    setUp(() {
      mockNavigatorBloc = MockNavigatorBloc();
      mockSignUpUseCase = MockSignUpUseCase();
      signUpBloc = SignUpBloc(
          navigatorBloc: mockNavigatorBloc, signUpUseCase: mockSignUpUseCase);
    });

    tearDown(() {
      signUpBloc.close();
    });


    test('initial state is UserLoadedState', ()  async{
       signUpBloc.add(SignUpEvent(
        userName: 'doc', email: 'losos3gmail.com', password: '1q2w3e4r5t',));

    });
  });
}