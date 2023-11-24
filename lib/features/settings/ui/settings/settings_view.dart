import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/app/text_theme.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Display',
              style: context.titleMedium.bold,
            ),
          ),
          ValueListenableBuilder(
              valueListenable: settingsService.themeMode,
              builder: (context, mode, child) {
                return Column(
                  children: [
                    RadioListTile<ThemeMode>(
                      title: const Text('Light'),
                      value: ThemeMode.light,
                      groupValue: mode,
                      onChanged: (value) {
                        settingsService.setThemeMode(value.toString());
                      },
                    ),
                    RadioListTile<ThemeMode>(
                      title: const Text('Dark'),
                      value: ThemeMode.dark,
                      groupValue: mode,
                      onChanged: (value) {
                        settingsService.setThemeMode(value.toString());
                      },
                    ),
                    RadioListTile<ThemeMode>(
                      title: const Text('System'),
                      value: ThemeMode.system,
                      groupValue: mode,
                      onChanged: (value) {
                        settingsService.setThemeMode(value.toString());
                      },
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
