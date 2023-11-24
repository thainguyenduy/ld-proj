part of 'app_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

final class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}

final class _AppAccountChanged extends AppEvent {
  _AppAccountChanged(this.account);

  Account account;
}
