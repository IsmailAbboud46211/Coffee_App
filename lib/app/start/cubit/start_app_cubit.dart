import 'package:bloc/bloc.dart';
import 'package:coffe_app/core/database/boxes_names.dart';
import 'package:coffe_app/core/database/keys_names.dart';
import 'package:coffe_app/core/enum/boxes_type.dart';
import 'package:coffe_app/main.dart';
import 'package:meta/meta.dart';

part 'start_app_state.dart';

class StartAppCubit extends Cubit<StartAppState> {
  StartAppCubit() : super(StartAppInitial());

  bool _isOnBordingSkipped() {
    bool isOnBordingSkipped = hiveDB.getData(
      boxName: BoxesNames.settings,
      key: KeysNames.skipOnBording,
      boxType: BoxType.BOOLEAN,
      defaultValue: false,
    );
    return isOnBordingSkipped;
  }

  void startApp() {
    bool skipOnBording = _isOnBordingSkipped();
    if (skipOnBording) {
      emit(SkiepedOnBording());
    } else {
      emit(ShowOnBording());
    }
  }
}
