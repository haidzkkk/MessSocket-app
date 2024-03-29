import 'package:rxdart/rxdart.dart';

import '../../../core/usecases/usecase.dart';
import '../../data/datasource/common/result.dart';
import '../../domain/usecases/CheckBindingUseCase.dart';

class SplashBloc {
  SplashBloc(this._checkBindStatusUsecase);

  final CheckBindStatusUsecase _checkBindStatusUsecase;

  final _bindStatusOut = BehaviorSubject<ResultState<bool>>();

  Function(ResultState<bool>) get bindOut => _bindStatusOut.sink.add;

  Stream<ResultState<bool>> get bindStatusStream => _bindStatusOut.stream;

  void checkBindStatus() {
    print('method check binding status');
    bindOut(ResultState.setLoading());
    _checkBindStatusUsecase
        .execute(NoParams())
        .delay(const Duration(milliseconds: 1000))
        .listen((event) {
      event.fold((error) {
        return bindOut(ResultState.setError(error));
      }, (values) {
        return bindOut(ResultState.setResult(values));
      });
    });
  }

  void dispose() => _bindStatusOut.close();
}
