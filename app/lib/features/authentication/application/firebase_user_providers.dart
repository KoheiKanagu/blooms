import 'dart:async';

import 'package:blooms/constants/app_env.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_user_providers.g.dart';

/// [fb_auth.User]を取得する
///
/// 機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制している
/// Providerの名称を変える場合は、[talkerRiverpodObserver] も変更すること
@riverpod
Stream<fb_auth.User?> firebaseUser(Ref ref) =>
    ref.read(firebaseAuthProvider).userChanges();

/// UIDを取得する
///
/// サインインしていない場合はnullを返す
@riverpod
Future<String?> firebaseUserUid(Ref ref) =>
    ref.watch(firebaseUserProvider.selectAsync((value) => value?.uid));
