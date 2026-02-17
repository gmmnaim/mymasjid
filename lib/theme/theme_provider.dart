import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'app_theme.dart';

final themeProvider = StateProvider<AppTheme>((ref) {
  return themeOne;
});
