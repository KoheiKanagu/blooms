import 'package:blooms/utils/configure/shared_preferences_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_providers.g.dart';

const _onboardingCompletedKey = 'onboardingCompleted';

/// オンボーディングが完了しているかどうか
@riverpod
Future<bool> onboardingIsCompleted(Ref ref) async {
  return ref
      .watch(sharedPreferencesProvider)
      .getBool(_onboardingCompletedKey)
      .then((e) => e ?? false);
}

/// オンボーディングが完了したことを記録
@riverpod
Future<void> onboardingComplete(Ref ref) async {
  return ref
      .watch(sharedPreferencesProvider)
      .setBool(_onboardingCompletedKey, true);
}
