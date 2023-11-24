import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ld_app/src/domain/account.dart';
import 'package:ld_app/src/infrastructure/auth/i_auth_facade.dart';

@Singleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  Dio dio;
  AuthFacade(this.dio);
  final _controller = StreamController<Account>();
  @override
  Stream<Account> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield* _controller.stream;
  }

  /// Throws a [LogOutFailure] if an exception occurs.
  @override
  Future<void> logOut() async {
    throw UnimplementedError();
  }

  @override
  Future<Account> register({required String phone, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Token> logIn({
    required String phone,
    required String password,
  }) {
    final access_token =
        dio.post('login', data: {phone: phone, password: password});
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  // TODO: implement currentAccount
  Account? get currentAccount => null;
}
