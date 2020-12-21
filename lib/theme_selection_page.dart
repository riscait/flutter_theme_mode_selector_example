import 'package:flutter/material.dart';

import 'theme_list_view.dart';

class ThemeSelectionPage extends StatelessWidget {
  const ThemeSelectionPage();

  static const String routeName = '/theme-selection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('テーマ設定')),
      body: const SafeArea(
        child: const ThemeListView(),
      ),
    );
  }
}
