import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

final themeSelectorProvider = StateNotifierProvider(
  (ref) => ThemeSelector(ref.read),
);

class ThemeSelector extends StateNotifier<ThemeMode> {
  ThemeSelector(this._reader) : super(ThemeMode.system) {
    _initialize();
    SharedPreferences.getInstance().then((prefs) => _prefs = prefs);
  }

  /// SharedPreferences で使用するテーマ保存用のキー
  static const themePrefsKey = 'selectedThemeKey';

  // `Reader` で他のProviderを読み込むことが無いなら削除しても良い
  // ignore: unused_field
  final Reader _reader;

  SharedPreferences _prefs;

  /// テーマの変更を行う
  Future changeAndSave(ThemeMode theme) async {
    await _save(theme.index);
    state = theme;
  }

  /// テーマの選択値を取得して反映
  Future _initialize() async {
    final themeIndex = await _themeIndex;
    state = ThemeMode.values.firstWhere(
      (e) => e.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
  }

  /// 選択テーマを `SharedPreferences` から取得
  Future<int> get _themeIndex async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs.getInt(themePrefsKey);
  }

  /// 選択したテーマを`SharedPreferences` で保存
  Future<void> _save(int themeIndex) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs.setInt(themePrefsKey, themeIndex);
  }
}
