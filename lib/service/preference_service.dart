import 'dart:convert';
import 'package:finance_house_task/global.dart';
import 'package:finance_house_task/model/movie/cache_data.dart';
import 'package:finance_house_task/model/movie/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/enum.dart';

// Service to manage preferences and database interactions (e.g., SharedPreferences, Isar database)
class PreferencesService {
  PreferencesService._internal();

  // Singleton pattern: Provides a single instance of PreferencesService
  factory PreferencesService() => _instance;

  static final PreferencesService _instance = PreferencesService._internal();

  static const auth_token =
      "auth_token"; // Key to store the authentication token

  // Helper function to get an instance of SharedPreferences for storing data locally
  Future<SharedPreferences> _getInstance() async {
    return SharedPreferences.getInstance();
  }

  // Function to get a hardcoded authentication token
  // This could be replaced with real token retrieval logic in a real app
  String getToken() {
    return 'test_token'; // Return a placeholder token for testing purposes
  }

  // Function to store the authentication token in SharedPreferences
  // The token is saved with the key "auth_token"
  setAuthToken(String token) async {
    (await _getInstance()).setString(
        PreferencesService.auth_token, token); // Save the token locally
  }

  // Function to retrieve the authentication token from SharedPreferences
  // Returns the token or null if it's not found
  Future<String?> getAuthToken() async {
    return (await _getInstance()).getString(PreferencesService
        .auth_token); // Fetch the token from SharedPreferences
  }
}
