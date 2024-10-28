import 'package:untitled/src/reusable/constants/AppKeys.dart';

import '../../reusable/enums/enums.dart';
import '../location_service/local_storage_service.dart';

mixin ClientUtils {
  static BaseOptions getOptions({bool isAuth = true}) {
    String? bearerToken =
        LocalStorageService.getString(AppKeys.BEARER_TOKEN);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    if (isAuth) {
      headers['Authorization'] = 'Bearer $bearerToken';
    }

    return BaseOptions(
      baseUrl: AppKeys.BASE_URL,
      headers: headers,
      sendTimeout: isAuth ? null : const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 8),
      contentType: 'application/json',
      validateStatus: (status) {
        return status! >= 200 && status < 400;
      },
    );
  }
}

class BaseOptions {
  final String? baseUrl;
  final Map<String, String>? headers;
  final Duration? sendTimeout;
  final Duration? receiveTimeout;
  final String? contentType;
  final ResponseType? responseType;
  final bool Function(int?)? validateStatus;

  BaseOptions({
    this.baseUrl,
    this.headers,
    this.sendTimeout,
    this.receiveTimeout,
    this.contentType,
    this.responseType,
    this.validateStatus,
  });
}
