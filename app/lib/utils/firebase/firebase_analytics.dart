import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_analytics.g.dart';

@riverpod
FirebaseAnalytics firebaseAnalytics(Ref ref) => FirebaseAnalytics.instance;

@riverpod
class FirebaseAnalyticsController extends _$FirebaseAnalyticsController {
  @override
  FirebaseAnalytics build() => ref.read(firebaseAnalyticsProvider);
}
