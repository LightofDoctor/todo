import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main (){
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    group('app_test', () {
      testWidgets('add question in database and get response', (teaster)async {
         app.main();
      });
    });
}