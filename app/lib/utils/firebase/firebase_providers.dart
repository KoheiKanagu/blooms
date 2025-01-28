import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_providers.g.dart';

@riverpod
FirebaseFirestore firebaseFirestore(Ref ref) => FirebaseFirestore.instance;

@riverpod
FirebaseCrashlytics firebaseCrashlytics(Ref ref) =>
    FirebaseCrashlytics.instance;

@riverpod
FirebaseAuth firebaseAuth(Ref ref) => FirebaseAuth.instance;

@riverpod
FirebaseMessaging firebaseMessaging(Ref ref) => FirebaseMessaging.instance;

@riverpod
FirebaseStorage firebaseStorage(Ref ref) => FirebaseStorage.instance;

@riverpod
Future<List<String>> firebaseStorageGsFileDownloadUrls(
  Ref ref, {
  required List<String> gsPaths,
}) async {
  return Future.wait(
    gsPaths.map(
      (e) => ref.read(firebaseStorageProvider).refFromURL(e).getDownloadURL(),
    ),
  );
}
