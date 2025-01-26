import 'package:blooms/utils/configure/shared_preferences_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_providers.g.dart';

const _onboardingCompletedKey = 'onboardingCompleted';

/// オンボーディングが完了しているかどうか
@riverpod
bool onboardingIsCompleted(Ref ref) {
  return ref
          .read(sharedPreferencesProvider)
          .requireValue
          .getBool(_onboardingCompletedKey) ??
      false;
}

/// オンボーディングが完了したことを記録
@riverpod
void onboardingComplete(Ref ref) {
  ref
      .read(sharedPreferencesProvider)
      .requireValue
      .setBool(_onboardingCompletedKey, true);
}
