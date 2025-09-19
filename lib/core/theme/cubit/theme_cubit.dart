import 'package:flutter_bloc/flutter_bloc.dart';

enum AppTheme { light, dark }

class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(AppTheme.dark);

  void toggleTheme() {
    emit(state == AppTheme.dark ? AppTheme.light : AppTheme.dark);
  }
}
