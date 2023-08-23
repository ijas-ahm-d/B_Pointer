// GET METHOD
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:b_pointer/repo/api_status.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<Object> getMEthod({
    required String url,
    required Function function,
    Map<String, String>? headers,
  }) async {
    try {
      log("get function:22");
      final response = await http.get(Uri.parse(url), headers: headers);

      log("get function:33");
      log(response.body.toString());
      log("******${response.statusCode}******");
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("success");
        return Success(response: function(response.body));
      }
      log("failures");
      return Failures(
          code: response.statusCode, responseMsg: "Invalid response");
    } on HttpException {
      return Failures(code: 101, errrorResponse: "No Internet");
    } on FormatException {
      log('thissss error');
      return Failures(code: 102, errrorResponse: "Invalid Format");
    } on SocketException catch (e) {
      log(e.toString());
      return Failures(code: 101, errrorResponse: "No Internet");
    } on TimeoutException {
      return Failures(code: 104, errrorResponse: "Time Out");
    } catch (e) {
      log(e.toString());
      return Failures(code: 500, errrorResponse: "UNKnown error");
    }
  }
}
