import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

Future<T?> appToastWrapper<T>(Future<T> Function() requestFunction) async {
  try {
    return await requestFunction();
  } on DioException catch (ex) {
    debugPrint(' dio error => $ex');
  } catch (ex, stackTrace) {
    debugPrint(' ex error => $ex , stackTrace => $stackTrace ');
  }

  return null;
}
