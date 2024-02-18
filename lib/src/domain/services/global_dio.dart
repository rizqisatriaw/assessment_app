import 'package:assessment_app/src/domain/services/local_storage_service.dart';
import 'package:dio/dio.dart';

import '../../../configs/constants/api_const.dart';

Dio globalDio = Dio(
  BaseOptions(
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Cookie': 'token=${LocalStorageService.token}',
    },
    baseUrl: ApiConst.baseUrl,
    contentType: "application/json",
    responseType: ResponseType.json,
    connectTimeout: const Duration(milliseconds: 10000),
  ),
);
