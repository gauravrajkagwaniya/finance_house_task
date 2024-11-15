import 'package:finance_house_task/store/root_store.dart';

import '../../global.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreObserver(builder: (RootStore store, context) {
      return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            ListTile(
              title: const Text(ExtraStrings.darkMode),
              trailing: Switch(
                value: store.themeStore.isDarkMode,
                onChanged: (value) {
                  store.themeStore.toggleTheme();
                },
                activeTrackColor: Colors.grey[700],
                inactiveTrackColor: Colors.grey[300],
                activeColor: Colors.blue,
                inactiveThumbColor: Colors.white,
                thumbIcon: store.themeStore.isDarkMode
                    ? WidgetStateProperty.all(
                        const Icon(Icons.nightlight_round, color: Colors.white))
                    : WidgetStateProperty.all(
                        const Icon(Icons.wb_sunny, color: Colors.orange)),
              ),
            ),
          ],
        ),
      );
    });
  }
}
