import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'mocks/theme_store.fake.mocks.dart';

void main() {
  late MockThemeStore mockThemeStore;

  setUp(() {
    // Initialize the ThemeStore with the mocked RootStore
    mockThemeStore = MockThemeStore();
  });

  group('ThemeStore Tests', () {
    test('Initial state is false for dark mode', () {
      // Initially, isDarkMode should be false
      expect(mockThemeStore.isDarkMode, false);
    });

    test('toggleTheme toggles dark mode state', () {
      // Initially, the value of isDarkMode should be false
      expect(mockThemeStore.isDarkMode, false);

      when(mockThemeStore.isDarkMode).thenReturn(true);
      // Call toggleTheme to change the value of isDarkMode
      mockThemeStore.toggleTheme();

      // After the toggle, isDarkMode should be true
      expect(mockThemeStore.isDarkMode, true);

      // Call toggleTheme again to change the value back to false
      mockThemeStore.toggleTheme();

      when(mockThemeStore.isDarkMode).thenReturn(false);
      // After the second toggle, isDarkMode should be false again
      expect(mockThemeStore.isDarkMode, false);
    });
  });
}
