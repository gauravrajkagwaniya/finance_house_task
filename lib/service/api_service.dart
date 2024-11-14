import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../app_config.dart';
import '../global.dart';

// Base URL for API requests, typically loaded from app configuration
// ignore: non_constant_identifier_names
String BASE_URL = baseUrl;

// Abstract class that defines the API service methods
abstract class APIService {

  // GET request method
  // Parameters:
  // - url: the endpoint to request
  // - params: query parameters to append to the URL (optional)
  // - useAuthHeaders: flag to include Authorization headers (default: true)
  // - customHeader: any custom headers to add to the request (optional)
  // - useBaseUrl: flag to determine whether to use the base URL (default: true)
  Future<Map<String, dynamic>?> get(String url,
      // ignore: avoid_init_to_null
          {Map<String, String?>? params = null,
        bool useAuthHeaders = true,
        Map<String, String?>? customHeader,
        useBaseUrl = true}) async {
    try {
      // Perform GET request using the URL and parameters
      var data = await http.get(Uri.parse(_getUrlWithParams(url, params: params, useBaseUrl: useBaseUrl)),
          headers: await _getHeaders(
              useAuthHeaders: useAuthHeaders, customHeader: customHeader));
      print("data: ${data.body}");  // Log the response body for debugging
      return _getResponse(data);  // Parse and return the response
    } catch (e) {
      return null;  // Return null in case of error
    }
  }

  // POST request method
  // Parameters:
  // - url: the endpoint to send the POST request to
  // - body: the request payload (required)
  // - useAuthHeaders: flag to include Authorization headers (default: true)
  Future<Map<String, dynamic>?> post(String url,
      {required Map<String, dynamic> body, bool useAuthHeaders = true}) async {
    final response = await http.post(Uri.parse(_getUrl(url)),
        headers: await _getHeaders(useAuthHeaders: useAuthHeaders),
        body: json.encode(body));  // Convert body to JSON
    return _getResponse(response);  // Parse and return the response
  }

  // PUT request method
  // Parameters:
  // - url: the endpoint to send the PUT request to
  // - body: the request payload (required)
  // - useAuthHeaders: flag to include Authorization headers (default: true)
  Future<Map<String, dynamic>?> put(String url,
      {required Map<String, String> body, bool useAuthHeaders = true}) async {
    final response = await http.put(Uri.parse(_getUrl(url)),
        headers: await _getHeaders(useAuthHeaders: useAuthHeaders), body: body);
    return _getResponse(response);  // Parse and return the response
  }

  // PATCH request method
  // Parameters:
  // - url: the endpoint to send the PATCH request to
  // - body: the request payload (required)
  // - useAuthHeaders: flag to include Authorization headers (default: true)
  Future<Map<String, dynamic>?> patch(String url,
      {required Map<String, dynamic> body, bool useAuthHeaders = true}) async {
    final response = await http.patch(Uri.parse(_getUrl(url)),
        headers: await _getHeaders(useAuthHeaders: useAuthHeaders),
        body: json.encode(body));  // Convert body to JSON
    return _getResponse(response);  // Parse and return the response
  }

  // DELETE request method
  // Parameters:
  // - url: the endpoint to send the DELETE request to
  // - params: query parameters (optional)
  // - useAuthHeaders: flag to include Authorization headers (default: true)
  Future<Map<String, dynamic>?> delete(String url,
      {Map<String, String>? params, bool useAuthHeaders = true}) async {
    final response = await http.delete(
        Uri.parse(_getUrlWithParams(url, params: params, useBaseUrl: true)),
        headers: await _getHeaders(useAuthHeaders: useAuthHeaders));
    return _getResponse(response);  // Parse and return the response
  }

  // Helper Method to construct the full URL
  String _getUrl(String url) {
    print(" Url :  $BASE_URL$url");  // Log the full URL for debugging
    return BASE_URL + url;  // Return the complete URL by concatenating the base URL with the endpoint
  }

  // Helper Method to construct headers for requests
  // Parameters:
  // - useAuthHeaders: flag to include Authorization headers (default: true)
  // - customHeader: any additional custom headers (optional)
  Future<Map<String, String>?> _getHeaders(
      {bool useAuthHeaders = true, customHeader}) async {
    Map<String, String> map = <String, String>{};

    // If the Authorization headers are to be included, add the token to the headers
    if (useAuthHeaders) {
      map['Authorization'] = "Bearer ${ExtraStrings.token}";
    }

    // If custom headers are provided, merge them with the default headers
    if (customHeader != null) {
      map = {...map, ...customHeader};
    }
    return map;
  }

  // Helper Method to construct a URL with query parameters
  // Parameters:
  // - url: the endpoint to request
  // - params: the query parameters to append to the URL (optional)
  // - useBaseUrl: flag to determine if the base URL should be included (default: true)
  String _getUrlWithParams(String url,
      {Map<String, String?>? params, useBaseUrl = true}) {
    String absUrl;

    // If useBaseUrl is true, construct the full URL with the base URL
    if (useBaseUrl) {
      absUrl = _getUrl(url);
    } else {
      absUrl = url;  // Use the provided URL without the base URL
    }

    // If there are query parameters, append them to the URL
    if (params != null) {
      var paramsString = '';
      params.forEach((key, value) {
        if (value != null) {
          paramsString += '&$key=$value';  // Construct query string
        }
      });
      print('$absUrl?${paramsString.substring(1)}');  // Log the URL with query parameters for debugging
      return '$absUrl?${paramsString.substring(1)}';  // Return the full URL with query parameters
    }

    return absUrl;  // Return the base URL if no parameters are provided
  }

  // Helper Method to parse the HTTP response
  // Parameters:
  // - response: the response object returned from the HTTP request
  Map<String, dynamic>? _getResponse(http.Response response) {
    // If the response body is empty, return null
    if (response.body == null || response.body.trim().isEmpty) {
      return null;
    }
    print("getting response: ,${response.body} ");  // Log the raw response body
    final Map<String, dynamic> body = json.decode(response.body);  // Decode the JSON response body
    print("parsing response : ,${response.body} ");  // Log the parsed response for debugging

    // If the response status is not successful, throw an error
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw AppError(body['data'], null);  // Custom error handling (AppError is presumably defined elsewhere)
    }

    return body;  // Return the parsed response body
  }
}
