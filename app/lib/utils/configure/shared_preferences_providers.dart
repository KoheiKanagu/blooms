import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_providers.g.dart';

@Riverpod(keepAlive: true)
SharedPreferencesAsync sharedPreferences(Ref ref) => SharedPreferencesAsync();
