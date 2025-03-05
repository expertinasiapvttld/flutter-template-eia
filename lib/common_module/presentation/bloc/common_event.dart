part of 'common_bloc.dart';

@immutable
abstract class CommonEvent {}

class SetLocaleEvent extends CommonEvent {
  final Locale locale;

  SetLocaleEvent(this.locale);
}
