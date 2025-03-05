part of 'common_bloc.dart';

@immutable
abstract class CommonState {}

class CommonInitial extends CommonState {}

class LocaleLoadedState extends CommonState {
  final Locale locale;

  LocaleLoadedState(this.locale);
}
