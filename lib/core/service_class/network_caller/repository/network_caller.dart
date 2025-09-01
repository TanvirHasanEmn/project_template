import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

import '../../../logging/logger.dart';
import '../model/network_response.dart';

class NetworkCaller {
  final int timeoutDuration = 80;
  String? token;

  Future<ResponseData> getRequest(String url, {String? token}) async {
    AppLoggerHelper.info('GET Request: $url');
    try {
      final Response response = await get(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Authorization': token ?? '',
        },
      ).timeout(Duration(seconds: timeoutDuration));
      log(response.headers.toString());
      log(response.statusCode.toString());
      log(response.body.toString());
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<ResponseData> postRequest(
    String url, {
    Map<String, dynamic>? body,
    String? token,
  }) async {
    AppLoggerHelper.info('POST Request: $url');
    AppLoggerHelper.info('Request Body: ${jsonEncode(body)}');

    try {
      final Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Authorization': token ?? '',
        },
        body: jsonEncode(body),
      ).timeout(Duration(seconds: timeoutDuration));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<ResponseData> putRequest(
    String url, {
    Map<String, dynamic>? body,
    String? token,
  }) async {
    AppLoggerHelper.info('PUT Request: $url');
    AppLoggerHelper.info('Request Body: ${jsonEncode(body)}');

    try {
      final Response response = await put(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Authorization': token ?? '',
        },
        body: jsonEncode(body),
      ).timeout(Duration(seconds: timeoutDuration));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<ResponseData> deleteRequest(String url, String? token) async {
    AppLoggerHelper.info('DELETE Request: $url');
    try {
      final Response response = await delete(
        Uri.parse(url),
        headers: {
          'Authorization': token ?? "",
          'Content-type': 'application/json',
        },
      ).timeout(Duration(seconds: timeoutDuration));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<ResponseData> patchRequest(
    String url, {
    Map<String, dynamic>? body,
    String? token,
  }) async {
    AppLoggerHelper.info('Patch Request: $url');
    AppLoggerHelper.info('Patch body: $body');

    try {
      final Response response = await patch(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Authorization': token ?? '',
        },
        body: jsonEncode(body),
      ).timeout(Duration(seconds: timeoutDuration));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<Map<String, dynamic>> putFormDataWithImage(
    String res,
    String url,
    Map<String, dynamic> body,
    File imageFile, {
    String mainKey = "",
    String? token = "",
    String imageName = "profileImage",
  }) async {
    log('Request token: $token');
    log('Request Body: ${jsonEncode(body)}');

    try {
      var request = http.MultipartRequest(res, Uri.parse(url));
      request.headers.addAll({'Authorization': token ?? ""});

      String filePath = imageFile.path;
      String? mimeType = lookupMimeType(filePath);

      if (mimeType == null) {
        log('Could not determine MIME type for the file');
        return {'success': false, 'message': 'Invalid file type'};
      }

      request.files.add(
        await http.MultipartFile.fromPath(
          imageName,
          filePath,
          contentType: MediaType.parse(mimeType),
        ),
      );
      request.fields[mainKey] = jsonEncode(body);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      log('Response Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        return {
          'success': true,
          'message': 'Success',
          'data': jsonDecode(response.body),
        };
      } else if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'Success',
          'data': jsonDecode(response.body),
        };
      } else {
        return {'success': false, 'message': response.body};
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return {'success': false, 'message': 'Exception: $e'};
    }
  }

  Future<Map<String, dynamic>> putImage(
      String res,
      String url,
      Map<String, dynamic> body,
      File imageFile, {
        String? token = "",
        String imageName = "profileImage",
      }) async {
    log('Request token: $token');
    log('Request Body: ${jsonEncode(body)}');

    try {
      var request = http.MultipartRequest(res, Uri.parse(url));
      request.headers.addAll({'Authorization': token ?? ""});

      String filePath = imageFile.path;
      String? mimeType = lookupMimeType(filePath);

      if (mimeType == null) {
        log('Could not determine MIME type for the file');
        return {'success': false, 'message': 'Invalid file type'};
      }

      request.files.add(
        await http.MultipartFile.fromPath(
          imageName,
          filePath,
          contentType: MediaType.parse(mimeType),
        ),
      );

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      log('Response Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        return {
          'success': true,
          'message': 'Success',
          'data': jsonDecode(response.body),
        };
      } else if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'Success',
          'data': jsonDecode(response.body),
        };
      } else {
        return {'success': false, 'message': response.body};
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return {'success': false, 'message': 'Exception: $e'};
    }
  }

  Future<Map<String, dynamic>> patchDocuments(
    String res,
    String url,
    Map<String, dynamic> body,
    File imageFontFile,
    File imageBackFile, {
    String? token = "",
    String IDCardFont = "IDCardFont",
    String IDCardBack = "IDCardBack",
  }) async {
    log('Request token: $token');
    log('Request Body: ${jsonEncode(body)}');

    try {
      var request = http.MultipartRequest(res, Uri.parse(url));
      request.headers.addAll({'Authorization': token ?? ""});

      String fontFilePath = imageFontFile.path;
      String? mimeType = lookupMimeType(fontFilePath);

      String backFilePath = imageBackFile.path;
      String? mimeType2 = lookupMimeType(backFilePath);

      if (mimeType == null) {
        log('Could not determine MIME type for the file');
        return {'success': false, 'message': 'Invalid Font file type'};
      }
      if (mimeType2 == null) {
        log('Could not determine MIME type for the file');
        return {'success': false, 'message': 'Invalid Back file type'};
      }

      request.files.add(
        await http.MultipartFile.fromPath(
          IDCardFont,
          fontFilePath,
          contentType: MediaType.parse(mimeType),
        ),
      );
      request.files.add(
        await http.MultipartFile.fromPath(
          IDCardBack,
          backFilePath,
          contentType: MediaType.parse(mimeType2),
        ),
      );

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      log('Response Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'Success',
          'data': jsonDecode(response.body),
        };
      } else {
        return {'success': false, 'message': response.body};
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return {'success': false, 'message': 'Exception: $e'};
    }
  }

  Future<String> sendFormDataWithImage(
    String url,
    dynamic body,
    List<dynamic> imageFiles, {
    String? token,
  }) async {
    try {
      AppLoggerHelper.info('Patch Request: $url');
      AppLoggerHelper.info('Patch body: $body');
      AppLoggerHelper.info('Patch body: $imageFiles');
      var request = MultipartRequest('PATCH', Uri.parse(url));

      request.fields['textData'] = jsonEncode(body);

      if (imageFiles.isNotEmpty) {
        final mimeType = lookupMimeType(imageFiles[0].path);
        print("MIME Type (IDCardFont): $mimeType");
        var fontFile = await MultipartFile.fromPath(
          'IDCardFont',
          imageFiles[0].path,
          filename: path.basename(imageFiles[0].path),
        );
        debugPrint(fontFile.filename);
        request.files.add(fontFile);
      }
      if (imageFiles.length > 1) {
        final mimeType = lookupMimeType(imageFiles[1].path);
        print("MIME Type (IDCardBack): $mimeType");
        var backFile = await MultipartFile.fromPath(
          'IDCardBack',
          imageFiles[1].path,
          filename: path.basename(imageFiles[1].path),
        );
        debugPrint(backFile.filename);
        request.files.add(backFile);
      }

      request.headers.addAll({'Authorization': token!});

      var response = await request.send();
      var data = await Response.fromStream(response);
      AppLoggerHelper.info('Patch response: ${data.body}');
      if (response.statusCode == 307) {
        return jsonDecode(data.body)["message"];
      }
      debugPrint(jsonDecode(data.body).toString());
      if (response.statusCode == 201) {
        return "Success";
      } else {
        return jsonDecode(data.body).toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  ResponseData _handleResponse(Response response) {
    AppLoggerHelper.info('Response Status: ${response.statusCode}');
    AppLoggerHelper.info('Response Body: ${response.body}');

    final decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (decodedResponse['success'] == true) {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse['data'],
          errorMessage: '',
        );
      } else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: decodedResponse['message'] ?? 'Unknown error occurred',
        );
      }
    } else if (response.statusCode == 400) {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedResponse,
        errorMessage: _extractErrorMessages(decodedResponse['errorSources']),
      );
    } else if (response.statusCode == 500) {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedResponse,
        errorMessage:
            decodedResponse['message'] ?? 'An unexpected error occurred!',
      );
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedResponse,
        errorMessage: decodedResponse['message'] ?? 'An unknown error occurred',
      );
    }
  }

  String _extractErrorMessages(dynamic errorSources) {
    if (errorSources is List) {
      return errorSources
          .map((error) => error['message'] ?? 'Unknown error')
          .join(', ');
    }
    return 'Validation error';
  }

  ResponseData _handleError(dynamic error) {
    AppLoggerHelper.info('Request Error: $error');

    if (error is ClientException) {
      return ResponseData(
        isSuccess: false,
        statusCode: 500,
        responseData: '',
        errorMessage: 'Network error occurred. Please check your connection.',
      );
    } else if (error is TimeoutException) {
      return ResponseData(
        isSuccess: false,
        statusCode: 408,
        responseData: '',
        errorMessage: 'Request timeout. Please try again later.',
      );
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: 500,
        responseData: '',
        errorMessage: 'Unexpected error occurred.',
      );
    }
  }

  Future<Response?> getRequestForData(String url, {String? token}) async {
    AppLoggerHelper.info('GET Request: $url');
    AppLoggerHelper.info('GET Token: $url');

    Response? response;

    try {
      response = await get(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Authorization': token ?? '',
        },
      ).timeout(Duration(seconds: timeoutDuration));
      final responseDecode = jsonDecode(response.body);
      if (responseDecode['success']) {
        log(response.headers.toString());
        log(response.statusCode.toString());
        log(response.body.toString());
        return response;
      }
    } catch (e) {
      return response;
    }
    return null;
  }
}
