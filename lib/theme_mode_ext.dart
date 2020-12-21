import 'package:flutter/material.dart';

extension ThemeModeExt on ThemeMode {
  /// タイトル文字列
  String get title {
    switch (this) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Lignt';
      case ThemeMode.dark:
        return 'Dark';
    }
    throw AssertionError();
  }

  /// サブタイトル文字列
  String get subtitle {
    switch (this) {
      case ThemeMode.system:
        return '端末のシステム設定に追従';
      case ThemeMode.light:
        return '明るいテーマ';
      case ThemeMode.dark:
        return '暗いテーマ';
    }
    throw AssertionError();
  }

  /// アイコン
  IconData get iconData {
    switch (this) {
      case ThemeMode.system:
        return Icons.autorenew;
      case ThemeMode.light:
        return Icons.wb_sunny;
      case ThemeMode.dark:
        return Icons.nightlife;
    }
    throw AssertionError();
  }
}
