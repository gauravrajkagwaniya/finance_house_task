import '../global.dart';
import 'store/root_store.dart';
import 'utils/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RootStore>(create: (_) => RootStore()),
      ],
      child: StoreObserver(builder: (RootStore store, context) {
        return MaterialApp(
          title: 'Finance House Demo',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          locale: const Locale('de'),
          themeMode:
              store.themeStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: getAppTheme(Brightness.light),
          // Light theme
          darkTheme: getAppTheme(Brightness.dark),
          home: const HomePage(),
        );
      }),
    );
  }
}
