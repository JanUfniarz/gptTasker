import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/BLoCs/tutorial_bloc.dart';
import 'package:frontend/connection/tutorial_connector.dart';
import 'package:mockito/mockito.dart';

void main() {
  test("delete tutorial test", () async {
    Mock connector = MockTutorialConnector();
    TutorialBloc tested = TutorialBloc.instance;
    tested.connector = connector as MockTutorialConnector;

    reset(connector);

    when(connector.deleteData(-1)).thenAnswer((_) => Future.value());

    tested.redirectMethod(3);

    verify(connector.deleteData(-1));
  }, tags: ["tutorial", "blocs"]);
}

class MockTutorialConnector extends Mock implements TutorialConnector {}