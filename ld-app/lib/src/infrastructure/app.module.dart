import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:ld_app/src/infrastructure/notification.service.dart';
import 'package:ld_app/src/screens/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  // You can register named preemptive types like follows
  @Named("BaseUrl")
  String get baseUrl => dotenv.env['BASEURL']!;

  // url here will be injected
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(
      baseUrl: url,
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3)));

  @injectable
  AppRouter get appRouter => AppRouter();

  @preResolve
  Future<NotificationService> get notificationService =>
      NotificationService.init();
  @lazySingleton
  DeviceInfoPlugin get deviceInfo;

  @lazySingleton
  AndroidId get androidId;

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
