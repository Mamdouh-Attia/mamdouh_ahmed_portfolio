import 'package:flutter_bloc/flutter_bloc.dart';

enum AppLanguage { en, ar }

class LanguageCubit extends Cubit<AppLanguage> {
  LanguageCubit() : super(AppLanguage.en);

  void toggleLanguage() {
    emit(state == AppLanguage.en ? AppLanguage.ar : AppLanguage.en);
  }

  void setLanguage(AppLanguage lang) {
    emit(lang);
  }
}
