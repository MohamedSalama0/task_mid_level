import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task_mid_level/task3/network/dio_configuration.dart';
import 'package:task_mid_level/task3/resources/dialog_setup.dart';
import 'dart:io';
import 'dart:async';

class ApiProvider {
// next three lines makes this class a Singleton
  static final ApiProvider _instance = ApiProvider.internal();
  factory ApiProvider() => _instance;

  ApiProvider.internal() {
    _init();
  }
  final Dio dio = Dio();
  void _init() {
    DioConfig().set(dio);
  }

  Future<dynamic> request(
    String endPoint, {
    required dynamic body,
    required String method,
    required bool topLoader,
    required dynamic currentContext,
    dynamic header,
    bool showSuccessMessage = false,
    bool showErrorDialog = true,
    Function(String successMsg)? getMsg,
  }) async {
    //  dynamic currentContext = GlobalKey<NavigatorState>().currentContext!;
    if (topLoader) TopLoader.startLoading(currentContext);
    body ??= {};
    header = {
      'Accept': 'application/json',
    };
    try {
      print(body);
      var response = await dio.request(endPoint,
          data: body,
          options: Options(
            method: method,
            headers: header,
          ));

      // print('response => $response');

      log('response => ${response.data}');

      // responseJson = _dioResponse(response);
      if (topLoader) TopLoader.stopLoading(currentContext);

      // final requestResponse = RequestResponseModel.fromJson(response.data);

      if (response.data[0]['status'] != 'published') {
        if (showErrorDialog) {
          showResponseDialog(
            context: currentContext,
            responseMessage: 'Error',
            status: false,
          );
        }
        return null;
      }
      if (response.data[0]['status'] == 'published') {
        // requset succsseded

        await showResponseDialog(
          context: currentContext,
          responseMessage: 'succses',
          status: true,
        );
        return response.data ?? {};
      }
      return null;
    } on DioException catch (e) {
      if (topLoader) TopLoader.stopLoading(currentContext);
      if (kDebugMode) {
        print('error exiption');
        print(e.response?.data);
      }

      if (await InternetConnectionChecker().hasConnection) {
        print('has connection');
        if (showErrorDialog) {
          // Show error message to user
          showResponseDialog(
            context: currentContext,
            responseMessage: 'Error',
            status: false,
          );
        }
      } else {
        showResponseDialog(
          context: currentContext,
          responseMessage: 'No Connection',
          status: false,
        );
      }
    }
  }
}
