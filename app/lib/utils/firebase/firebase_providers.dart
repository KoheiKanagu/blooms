import 'package:blooms/extensions/ref_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_providers.g.dart';

@Riverpod(keepAlive: true)
FirebaseFirestore firebaseFirestore(Ref ref) => FirebaseFirestore.instance;

@Riverpod(keepAlive: true)
FirebaseCrashlytics firebaseCrashlytics(Ref ref) =>
    FirebaseCrashlytics.instance;

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(Ref ref) => FirebaseAuth.instance;

@Riverpod(keepAlive: true)
FirebaseStorage firebaseStorage(Ref ref) => FirebaseStorage.instance;

@riverpod
Future<String> firebaseStorageGsFileDownloadUrl(
  Ref ref, {
  required String fileUri,
}) async {
  ref.cacheFor(const Duration(minutes: 5));

  if (fileUri.startsWith('gs://')) {
    return ref
        .watch(firebaseStorageProvider)
        .refFromURL(fileUri)
        .getDownloadURL();
  } else {
    return fileUri;
  }
}

@Riverpod(keepAlive: true)
FirebaseFunctions firebaseFunctions(Ref ref) => FirebaseFunctions.instanceFor(
      region: 'asia-northeast1',
    );
