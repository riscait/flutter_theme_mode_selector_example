import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dark_theme_data.dart';
import 'light_theme_data.dart';
import 'theme_controller.dart';
import 'theme_selection_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    // 現在のテーマを取得
    final themeMode = useProvider(themeSelectorProvider.state);
    return MaterialApp(
      title: 'Flutter Demo',
      // ダークモードであればダークテーマを指定、
      // ライトモードかシステムモードであればライトテーマを指定することで、
      // ダークモード時は常時ダークテーマが使用されるようになります。
      theme: themeMode == ThemeMode.dark ? darkThemeData : lightThemeData,
      // 反対に、ライトモードであればライトテーマを指定、
      // ダークモードかシステムモードであればダークモードを指定することで、
      // ライトモード時は常時ライトテーマが使用されることになります。
      darkTheme: themeMode == ThemeMode.light ? lightThemeData : darkThemeData,
      home: const ThemeSelectionPage(),
    );
  }
}
